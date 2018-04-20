#
# Cookbook Name:: consul-template
# Recipe:: install_windows_binary
#
# Copyright (C) 2016
#
#
#

require 'chef/version_constraint'

url = ::URI.join(node['consul_template']['base_url'],
                 "#{node['consul_template']['version']}/",
                 ConsulTemplateHelpers.install_file(node)).to_s

download_path = "#{Chef::Config['file_cache_path']}\
/#{ConsulTemplateHelpers.install_file(node)}".tr('/', '\\')
install_path = "#{node['consul_template']['install_dir']}".tr('/', '\\')

remote_file download_path do
  source url
  checksum ConsulTemplateHelpers.install_checksum(node)
  action :create_if_missing
end

directory install_path do
  recursive true
  action :create
end

powershell_script 'Unzip consul_template' do
  code <<-PS
  $shell = new-object -com shell.application
  $zip = $shell.NameSpace('#{download_path}')
  foreach($item in $zip.items()) {
    $shell.Namespace('#{install_path}').copyhere($item)
  }
  PS
  not_if { ::File.exist?("#{install_path}\\consul-template.exe") }
end
