#
# attributes::default
#

default['consul_template']['base_url'] = 'https://releases.hashicorp.com/consul-template/'
default['consul_template']['version'] = '0.12.2'
default['consul_template']['install_method'] = 'binary'
default['consul_template']['install_dir'] = '/usr/local/bin'

default['consul_template']['source_revision'] = 'master'

# Service attributes
default['consul_template']['log_level'] = 'info'
default['consul_template']['config_dir'] = '/etc/consul-template.d'
default['consul_template']['init_style'] = platform?("ubuntu") ? 'upstart' : 'init' # 'init', 'runit', 'systemd', 'upstart'
default['consul_template']['service_user'] = 'consul-template'
default['consul_template']['service_group'] = 'consul-template'
default['consul_template']['template_mode'] = 0600

# Config attributes
default['consul_template']['config'] = Hash.new
