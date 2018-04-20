#
# Cookbook Name:: consul-template
# Recipe:: service_windows
#
# Copyright (C) 2016
#
#
#

require 'json'

# Configure directories
consul_template_directories = []
consul_template_directories << node['consul_template']['config_dir']

# Create service directories
consul_template_directories.each do |dirname|
  directory dirname
end

service_name = 'consul_template'
# Define global options here. use consul_template lwrp to register new
# templates
file File.join(node['consul_template']['config_dir'], 'default.json') do
  action :create
  content JSON.pretty_generate(node['consul_template']['config'], quirks_mode: true)
  notifies :restart, "service[#{service_name}]", :delayed
end

command = "#{node['consul_template']['install_dir']}\
/consul-template.exe".tr('/', '\\')

nssm_args = "-config=\"#{node['consul_template']['config_dir']}\""

nssm service_name do
  program command
  args nssm_args
  parameters node['consul_template']['nssm_params']
  action :install
end

service service_name do
  supports status: true, restart: true, start: true
  action %i[enable start]
end
