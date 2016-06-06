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

# Defince service parameters
poise_service_user node['consul_template']['service_user'] do
  group node['consul_template']['service_group']
end
cmd = "#{node['consul_template']['install_dir']}/consul-template"
opt = "-config #{node['consul_template']['config_dir']}"

# Create service directories
consul_template_directories.each do |dirname|
  directory dirname do
    owner node['consul_template']['service_user']
    group node['consul_template']['service_group']
    mode 0755
  end
end

# Define global options here. use consul_template lwrp to register new
# templates
file File.join(node['consul_template']['config_dir'], 'default.json') do
  user node['consul_template']['service_user']
  group node['consul_template']['service_group']
  mode node['consul_template']['template_mode']
  action :create
  content JSON.pretty_generate(node['consul_template']['config'], quirks_mode: true)
  notifies :restart, 'poise_service[consul-template]', :delayed
end

# Create service using poise
poise_service 'consul-template' do
  command "#{cmd} #{opt}"
end
