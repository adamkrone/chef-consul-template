#
# Cookbook Name:: consul-template
# Recipe:: service
#
# Copyright (C) 2014
#
#
#

require 'json'

# Configure directories
consul_template_directories = []
consul_template_directories << node['consul_template']['config_dir']

# Select service user & group
case node['consul_template']['init_style']
when 'runit'
  include_recipe 'runit::default'

  consul_template_user = node['consul_template']['service_user']
  consul_template_group = node['consul_template']['service_group']
  consul_template_directories << '/var/log/consul-template'
when 'systemd', 'upstart'
  consul_template_user = node['consul_template']['service_user']
  consul_template_group = node['consul_template']['service_group']
else
  consul_template_user = 'root'
  consul_template_group = 'root'
end

# Create service user
user consul_template_user do
  home '/dev/null'
  shell '/bin/false'
  comment 'consul-template service user'
end unless consul_template_user == 'root'

# Create service group
group consul_template_group do
  members consul_template_user
  append true
end unless consul_template_group == 'root'

# Create service directories
consul_template_directories.each do |dirname|
  directory dirname do
    owner consul_template_user
    group consul_template_group
    mode 0o755
  end
end

# Define global options here. use consul_template lwrp to register new
# templates
file File.join(node['consul_template']['config_dir'], 'default.json') do
  user consul_template_user
  group consul_template_group
  mode node['consul_template']['template_mode']
  action :create
  content JSON.pretty_generate(node['consul_template']['config'], quirks_mode: true)
  if node['consul_template']['init_style'] == 'runit'
    notifies :restart, 'runit_service[consul-template]', :delayed
  else
    notifies :restart, 'service[consul-template]', :delayed
  end
end

command = "#{node['consul_template']['install_dir']}/consul-template"
options = "-config #{node['consul_template']['config_dir']}"

case node['consul_template']['init_style']
when 'init', 'upstart'
  if node['consul_template']['init_style'] == 'upstart'
    is_upstart = true
    init_file = '/etc/init/consul-template.conf'
    init_tmpl = 'consul-template-conf.erb'
  else
    init_file = '/etc/init.d/consul-template'
    init_tmpl = 'consul-template-init.erb'
  end

  template init_file do
    source init_tmpl
    mode 0o755
    variables(
      command: command,
      options: options,
      loglevel: node['consul_template']['log_level'],
      service_user: consul_template_user,
      service_group: consul_template_group
    )
    notifies :restart, 'service[consul-template]', :immediately
  end

  service 'consul-template' do
    provider Chef::Provider::Service::Upstart if is_upstart
    supports status: true, restart: true, reload: true
    action [:enable, :start]
    subscribes :restart, "libarchive_file[#{ConsulTemplateHelpers.install_file(node)}]", :delayed
  end

when 'runit'
  runit_service 'consul-template' do
    supports status: true, restart: true
    action [:enable, :start]
    log true
    options(
      command: command,
      options: options
    )
    env 'CONSUL_TEMPLATE_LOG' => node['consul_template']['log_level']
    subscribes :restart, "libarchive_file[#{ConsulTemplateHelpers.install_file(node)}]", :delayed
  end

when 'systemd'
  template '/etc/systemd/system/consul-template.service' do
    source 'consul-template-systemd.erb'
    mode 0o755
    variables(
      command: command,
      options: options
    )
    notifies :restart, 'service[consul-template]', :immediately
  end

  service 'consul-template' do
    supports status: true, restart: true, reload: true
    action [:enable, :start]
    subscribes :restart, "libarchive_file[#{ConsulTemplateHelpers.install_file(node)}]", :delayed
  end

end
