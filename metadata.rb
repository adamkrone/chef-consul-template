name             'consul-template'
maintainer       'Adam Krone'
maintainer_email 'krone.adam@gmail.com'
license          'Apache v2.0'
description      'Installs/Configures consul-template'
long_description 'Installs/Configures consul-template'
version          '0.11.0'

recipe 'consul-template', 'Installs, configures, and starts the consul-template service.'
recipe 'consul-template::install_binary', 'Installs consul-template from binary.'
recipe 'consul-template::install_source', 'Installs consul-template from source.'
recipe 'consul-template::service', 'Configures and starts the consul-template service.'

supports 'ubuntu', '>= 12.04'
supports 'debian', '>= 6.0.10'
supports 'centos', '>= 6.7'
supports 'arch'

depends 'ark'
depends 'libarchive'
depends 'golang', '~> 1.4'
depends 'runit'
depends 'nssm', '~> 1.2'
depends 'poise-service'
depends 'poise-service-runit'

issues_url 'https://github.com/adamkrone/chef-consul-template/issues' if respond_to?(:issues_url)
source_url 'https://github.com/adamkrone/chef-consul-template' if respond_to?(:source_url)
