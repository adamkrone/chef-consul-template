#
# Cookbook Name:: consul-template
# Recipe:: install_binary
#
# Copyright (C) 2014
#
#
#

include_recipe 'ark::default'
require 'chef/version_constraint'

install_arch = node['kernel']['machine'] =~ /x86_64/ ? 'amd64' : '386'
install_0_11 = Chef::VersionConstraint.new(">= 0.11.0").include?(node['consul_template']['version'])
install_version = [
  'consul-template',
  node['consul_template']['version'],
  node['os'],
  install_arch
].join('_')
install_compression = install_0_11 ? '.zip' : '.tar.gz'
install_compression_path = install_0_11 ? '' : "#{install_version}/"
install_checksum = node['consul_template']['checksums'].fetch(install_version)

ark 'consul-template' do
  path node['consul_template']['install_dir']
  version node['consul_template']['version']
  checksum install_checksum
  url ::URI.join(node['consul_template']['base_url'],
                 "v#{node['consul_template']['version']}/",
                 "#{install_version}#{install_compression}").to_s
  creates "#{install_compression_path}consul-template"
  action :cherry_pick
end

file File.join(node['consul_template']['install_dir'], 'consul-template') do
  mode '0755'
  action :touch
end
