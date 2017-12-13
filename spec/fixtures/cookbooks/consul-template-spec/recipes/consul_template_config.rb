#
# Cookbook Name:: consul-template-spec
# Recipe:: consul_template_config
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'consul-template::default'
include_recipe 'curl'

template '/tmp/test.config.ctmpl' do
  source 'test.config.ctmpl.erb'
end

execute 'add test key/value' do
  command "curl -X PUT -d 'something' http://localhost:8500/v1/kv/test"
end

consul_template_config 'test' do
  templates [{
    source: '/tmp/test.config.ctmpl',
    destination: '/tmp/test.config',
    command: 'touch /tmp/consul-template-command-test',
    perms: 777
  }]
  notifies :restart, 'service[consul-template]'
end
