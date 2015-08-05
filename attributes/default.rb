#
# attributes::default
#

default['consul_template']['base_url'] = 'https://github.com/hashicorp/consul-template/releases/download/'
default['consul_template']['version'] = '0.10.0'
default['consul_template']['install_method'] = 'binary'
default['consul_template']['install_dir'] = '/usr/local/bin'

default['consul_template']['source_revision'] = 'master'

# Service attributes
default['consul_template']['consul_uri'] = '127.0.0.1:8500'
default['consul_template']['log_level'] = 'info'
default['consul_template']['config_dir'] = '/etc/consul-template.d'
default['consul_template']['service_user'] = 'consul-template'
default['consul_template']['service_group'] = 'consul-template'
default['consul_template']['template_mode'] = 0600
case platform
when 'redhat', 'centos', 'fedora', 'scientific'
  if node['platform_version'].to_f >= 6 && node['platform_version'].to_f < 7
    default['consul_template']['init_style'] = 'init'
  elsif node['platform_version'].to_f >= 7
    default['consul_template']['init_style'] = 'systemd'
  end
end

# Config attributes
default['consul_template']['config'] = Hash.new
