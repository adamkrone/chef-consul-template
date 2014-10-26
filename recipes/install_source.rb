#
# Cookbook Name:: consul-template
# Recipe:: install_source
#
# Copyright (C) 2014
#
#
#

include_recipe 'golang::default'

directory File.join(node['go']['gopath'], 'src/github.com/hashicorp') do
  owner 'root'
  group 'root'
  mode '00755'
  recursive true
  action :create
end

git File.join(node['go']['gopath'], '/src/github.com/hashicorp/consul-template') do
  repository 'https://github.com/hashicorp/consul-template.git'
  reference node['consul_template']['source_revision']
  action :checkout
end

golang_package 'github.com/hashicorp/consul-template' do
  action :install
end

link File.join(node['consul_template']['install_dir'], 'consul-template') do
  to File.join(node['go']['gobin'], 'consul-template')
end
