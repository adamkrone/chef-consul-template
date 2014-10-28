#
# Cookbook Name:: consul-template
# Recipe:: service
#
# Copyright (C) 2014
#
#
#

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
else
  consul_template_user = 'root'
  consul_template_group = 'root'
end

# Create service user
user "consul-template service user: #{consul_template_user}" do
  not_if { consul_template_user == 'root' }
  username consul_template_user
  home '/dev/null'
  shell '/bin/false'
  comment 'consul-template service user'
end

# Create service group
group "consul-template service group: #{consul_template_group}" do
  not_if { consul_template_group == 'root' }
  group_name consul_template_group
  members consul_template_user
  append true
end

# Create service directories
consul_template_directories.each do |dirname|
  directory dirname do
    owner consul_template_user
    group consul_template_group
    mode 0755
  end
end

# Determine service params
service_config = {}
service_config['consul'] = node['consul_template']['consul']
service_config['templates'] = node['consul_template']['templates']

optional_params = [
  :token, :wait
]

optional_params.each do |key|
  if node['consul_template'][key]
    service_config[key] = node['consul_template'][key]
  end
end

consul_template_config_filename = File.join(node['consul_template']['config_dir'], 'config.json')

template consul_template_config_filename do
  source 'config.json.erb'
  user consul_template_user
  group consul_template_group
  mode 0600
  variables(
    service_config: service_config
  )
  action :create
  notifies :restart, 'service[consul-template]', :delayed
end

case node['consul_template']['init_style']
when 'init'
  consul_template_binary = "#{node['consul_template']['install_dir']}/consul-template"
  config_dir = "-config #{consul_template_config_filename}"
  command = "#{consul_template_binary} #{config_dir}"

  template '/etc/init.d/consul-template' do
    source 'consul-template-init.erb'
    mode 0755
    variables(
      consul_template_binary: "#{node['consul_template']['install_dir']}/consul-template",
      config_dir: node['consul_template']['config_dir'],
      command: command,
    )
    notifies :restart, 'service[consul-template]', :delayed
  end

  service 'consul-template' do
    supports status: true, restart: true, reload: true
    action [:enable, :start]
  end
when 'runit'
  runit_service 'consul-template' do
    supports status: true, restart: true, reload: true
    action [:enable, :start]
    subscribes :restart, "file[#{consul_template_config_filename}]", :delayed
    log true
    options(
      consul_template_binary: "#{node['consul_template']['install_dir']}/consul-template",
      config_file: consul_template_config_filename,
    )
  end
end
