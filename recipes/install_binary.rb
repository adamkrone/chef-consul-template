#
# Cookbook Name:: consul-template
# Recipe:: install_binary
#
# Copyright (C) 2014
#
#
#

include_recipe 'libarchive::default' unless Chef::VERSION.to_i >= 14
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

libarchive_version = run_context.cookbook_collection['libarchive'].version.to_f.round(2)
case libarchive_version
when 2.0
  archive_file ConsulTemplateHelpers.install_file(node) do
    path download_path
    extract_to install_path
    mode 0755
    not_if { File.exist? install_path }
    action :extract
  end
when libarchive_version < 2.0
  libarchive_file ConsulTemplateHelpers.install_file(node) do
    path download_path
    extract_to install_path
    mode 0755
    not_if { File.exist? install_path }
    action :extract
  end
end

link "#{node['consul_template']['install_dir']}/consul-template" do
  to "#{install_path}/consul-template"
  mode 0755
end
