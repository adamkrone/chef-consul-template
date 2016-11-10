#
# Cookbook Name:: consul-template
# Recipe:: default
#
# Copyright (C) 2014
#
#
#

if node['platform'] == 'windows'
  include_recipe "consul-template::install_windows_#{node['consul_template']['install_method']}"
  include_recipe "consul-template::service_windows"
else
  include_recipe "consul-template::install_#{node['consul_template']['install_method']}"
  include_recipe "consul-template::service"
end
