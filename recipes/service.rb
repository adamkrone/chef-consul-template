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

# Define global options here. use consul_template lwrp to register new
# templates
template File.join(node['consul_template']['config_dir'], 'default.json') do
  source 'config.json.erb'
  user consul_template_user
  group consul_template_group
  mode node['consul_template']['template_mode']
  action :create
  notifies :restart, 'service[consul-template]', :delayed
end

command = "#{node['consul_template']['install_dir']}/consul-template"
options = "-config #{node['consul_template']['config_dir']}"

case node['consul_template']['init_style']

when 'init'
  template '/etc/init.d/consul-template' do
    source 'consul-template-init.erb'
    mode 0755
    variables( command: command, options: options )
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
    log true
    options( command: command, options: options )
  end

end
