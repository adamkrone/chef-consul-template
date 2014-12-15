#
# Cookbook Name:: consul-template-spec
# Recipe:: consul-template-config
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'consul-template'

consul_template_config 'haproxy' do
  templates [{ source: '/etc/haproxy/haproxy.cfg.ctmpl',
               destination: '/etc/haproxy/haproxy.cfg',
               command: 'service haproxy restart' }]
end
