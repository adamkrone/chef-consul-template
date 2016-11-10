#
# Cookbook Name:: consul-template-spec
# Recipe:: consul_template_config_win
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'consul-template::default'

template "#{ENV['SystemDrive']}\\test.config.ctmpl" do
  source 'test.config.ctmpl.erb'
end

consul_template_config 'test' do
  templates [{
    source: 'C:\\test.config.ctmpl',
    destination: 'C:\\test.config',
    command: 'echo %errorlevel% > C:/consul-template-command-test'
  }]
  notifies :restart, 'service[consul_template]'
end

powershell_script 'add test key/value' do
  code "Invoke-RestMethod -Method PUT -Body 'something' -Uri http://localhost:8500/v1/kv/test"
end
