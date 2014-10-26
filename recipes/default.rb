#
# Cookbook Name:: consul-template
# Recipe:: default
#
# Copyright (C) 2014
#
#
#

include_recipe "consul-template::install_#{node['consul_template']['install_method']}"
include_recipe "consul-template::service"
