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

url = ::URI.join(node['consul_template']['base_url'],
                 "#{node['consul_template']['version']}/",
                 ConsulTemplateHelpers.install_file(node)).to_s

download_path = "#{Chef::Config['file_cache_path']}/#{ConsulTemplateHelpers.install_file(node)}"
install_path = "#{node['consul_template']['install_dir']}/#{ConsulTemplateHelpers.install_version(node)}"

remote_file download_path do
  source url
  checksum ConsulTemplateHelpers.install_checksum(node)
  action :create_if_missing
end

libarchive_file ConsulTemplateHelpers.install_file(node) do
  path download_path
  extract_to install_path
  mode 0o755
  not_if { File.exist? install_path }
  action :extract
end

link "#{node['consul_template']['install_dir']}/consul-template" do
  to "#{install_path}/consul-template"
  mode 0o755
end
