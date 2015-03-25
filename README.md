# consul-template

[![Latest Version](http://img.shields.io/github/release/adamkrone/chef-consul-template.svg?style=flat-square)][release]
[![Build Status](http://img.shields.io/travis-ci/adamkrone/chef-consul-template.svg?style=flat-square)][build]
[![Coverage Status](https://img.shields.io/coveralls/adamkrone/chef-consul-template.svg?style=flat-square)][coverage]

[release]: https://github.com/adamkrone/chef-consul-template/releases
[build]: https://travis-ci.org/adamkrone/chef-consul-template
[coverage]: https://coveralls.io/r/adamkrone/chef-consul-template

Installs and configures [consul-template](https://github.com/hashicorp/consul-template).

## Supported Platforms

- Ubuntu 14.04, 12.04
- Debian 7.7, 6.0.10
- Centos 6.5

## Attributes

- `node['consul_template']['base_url']` - Base URL for consul-template binary files
- `node['consul_template']['version']` - Version of consul-template to install.
  Used to determine which binary to grab from the base_url.
- `node['consul_template']['install_method']` - How consul-template should be
  installed. Supports 'binary' or 'source'.
- `'node['consul_template']['install_dir']` - Directory where consul-template
  should be installed.
- `node['consul_template']['checksums']` - Contains a hash of checksums where
  the key is the file for a given OS/architecture, and the value is the
  associated checksum. For example, `consul-template_0.3.1_linux_amd64`.
- `node['consul_template']['source_revision']` - When installing from source,
  this determines the revision it should use.
- `node['consul_template']['config_dir']` - The directory that contains the
  configuration files for consul-template.
- `node['consul_template']['init_style']` - Defines the init system that the
  consul-template service should use. Supports 'init', 'runit', or 'systemd'.
- `node['consul_template']['service_user']` - Defines the user that should be
  used for the consul-template service.
- `node['consul_template']['service_group']` - Defines the group that should be
  used for the consul-template service.
- `node['consul_template']['template_mode']` - File permissions mode for all
  consul-template configuration files.

## Recipes

### default

Installs and configures consul-template using the install method specified in
`node['consul_template']['install_method']`.

### install_binary

Installs consul-template using one of the binaries provided by Hashicorp. It
will also verify the checksum. The default attributes includes the latest
version's binaries for all supported OS/architectures, including their
checksum.

### install_source

Installs consul-template from source.

### service

Installs and configures the consul-template service.

## LWRP

### consul_template_config

Creates configuration files in `node['consul_template']['config_dir']`, and
reloads the configuration.

For example, if you want to generate HAProxy's config using consul-template,
you may include something like this in your recipe:

```ruby
consul_template_config 'haproxy' do
  templates [{
    source: '/etc/haproxy/haproxy.cfg.ctmpl',
    destination: '/etc/haproxy/haproxy.cfg',
    command: 'service haproxy restart'
  }]
  notifies :reload, 'service[consul-template]', :delayed
end
```

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
