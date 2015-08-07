#
# attributes::default
#

default['consul_template']['base_url'] = 'https://github.com/hashicorp/consul-template/releases/download/'
default['consul_template']['version'] = '0.10.0'
default['consul_template']['install_method'] = 'binary'
default['consul_template']['install_dir'] = '/usr/local/bin'

default['consul_template']['source_revision'] = 'master'

# Service attributes
default['consul_template']['log_level'] = 'info'
default['consul_template']['config_dir'] = '/etc/consul-template.d'
default['consul_template']['init_style'] = 'init' # 'init', 'runit', 'systemd'
default['consul_template']['service_user'] = 'consul-template'
default['consul_template']['service_group'] = 'consul-template'
default['consul_template']['template_mode'] = 0600

# Config attributes
default['consul_template']['config'] = Hash.new
