#
# attributes::default
#

default['consul_template']['base_url'] = 'https://releases.hashicorp.com/consul-template/'
default['consul_template']['version'] = '0.19.4'
default['consul_template']['install_method'] = 'binary'
default['consul_template']['install_dir'] = if node['platform'] == 'windows'
                                              "#{ENV['SystemDrive']}/Program Files/consul_template"
                                            else
                                              '/usr/local/bin'
                                            end

default['consul_template']['source_revision'] = 'master'

# Service attributes
default['consul_template']['log_level'] = 'info'
default['consul_template']['config_dir'] = if node['platform'] == 'windows'
                                             "#{ENV['SystemDrive']}/Program Files/consul_template/consul_template.d"
                                           else
                                             '/etc/consul-template.d'
                                           end
default['consul_template']['consul_addr'] = '127.0.0.1:8500'
default['consul_template']['vault_addr'] = 'https://127.0.0.1:8200'

# 'init', 'runit', 'systemd', 'upstart'
default['consul_template']['init_style'] = node['init_package']
default['consul_template']['environment_variables'] = Hash.new

default['consul_template']['service_user'] = 'consul-template'
default['consul_template']['service_group'] = 'consul-template'
default['consul_template']['template_mode'] = 0600

# Config attributes
default['consul_template']['config'] = Hash.new

# Windows only
if node['platform'] == 'windows'
  default['consul_template']['nssm_params'] = {
    'AppDirectory'     => data_path,
    'AppStdout'        => join_path(config_prefix_path, 'stdout.log'),
    'AppStderr'        => join_path(config_prefix_path, 'error.log'),
    'AppRotateFiles'   => 1,
    'AppRotateOnline'  => 1,
    'AppRotateBytes'   => 20_000_000
  }
end
