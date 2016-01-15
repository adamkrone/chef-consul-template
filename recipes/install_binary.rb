#
# Cookbook Name:: consul-template
# Recipe:: install_binary
#
# Copyright (C) 2014
#
#
#

include_recipe 'libarchive::default'
require 'chef/version_constraint'

install_arch = node['kernel']['machine'] =~ /x86_64/ ? 'amd64' : '386'
install_version = [
  'consul-template',
  node['consul_template']['version'],
  node['os'],
  install_arch
].join('_')
install_extension = '.zip'
install_file = install_version + install_extension
install_checksum = node['consul_template']['checksums'].fetch(install_version)
url = ::URI.join(node['consul_template']['base_url'],
                 "#{node['consul_template']['version']}/",
                 "#{install_version}#{install_extension}").to_s

download_path = "#{Chef::Config['file_cache_path']}/#{install_file}"
install_path = "#{node['consul_template']['install_dir']}/#{install_version}"

remote_file download_path do
  source url
  checksum install_checksum
  action :create_if_missing
end

libarchive_file install_file do
  path download_path
  extract_to install_path
  mode 0755
  not_if { File.exist? install_path }
  action :extract
  notifies :restart, 'service[consul-template]', :delayed
end

link "#{node['consul_template']['install_dir']}/consul-template" do
  to "#{install_path}/consul-template"
  mode 0755
end
