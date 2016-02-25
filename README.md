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
- Debian 8.2, 7.9, 6.0.10
- Centos 7.2, 6.7
- Arch Linux

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

### Adding checksums for new versions

The `attributes/checksums.rb` file contains checksums for the current and past
consul-template versions. A quick and easy contribution you can make is to
update it when a new version of consul-template is released, as I'm not always
paying attention to when new versions come out.

In order to make this as easy and straightforward as possible, there is a helper
script (`scripts/generate-checksums`) that takes a version number, and returns
a pre-formatted list of the checkums (e.g. using version 0.10.0):

```bash
$ scripts/generate-checksums 0.10.0
Generating checksums for v0.10.0
'consul-template_0.10.0_darwin_386' => 'fb39f978f0e24175b7daee1f884e5299b11eb3a0689c37c7e96a26f9cadcbd77',
'consul-template_0.10.0_darwin_amd64' => '178e8e59d2e380440ac5582fb7f49c946ff931c1589ac85258d7dba82aefaabe',
'consul-template_0.10.0_freebsd_386' => '981b73d6547658d96bc5f2125dcc4161879c5c60c6eca3fa98b4a914f9f96581',
'consul-template_0.10.0_freebsd_amd64' => '0738c0887bb7ac2a879735ab61ea213ee042b5f53b27c6d26d4aa11f2bc6874a',
'consul-template_0.10.0_freebsd_arm' => '0488f76d3d0ca4b81ae807dfe7724b22380087adb5a4a49e73676095959e9f3c',
'consul-template_0.10.0_linux_386' => 'f9926eac99eb60ee1379e6f15a1d8240e96aa9076372914387005c8475d1e561',
'consul-template_0.10.0_linux_amd64' => 'ef298a2ae54cf51dbfc4108194299a9055b252ff9b917e7dd40c72fa30820096',
'consul-template_0.10.0_linux_arm' => '753b10added292b8873694d0f7905c4ddd62dd6bd3115f866ea5eee902d98f7c',
'consul-template_0.10.0_netbsd_386' => 'e1a6d759a91a2fa316af276c28643825727cd40ac214d12395ccfbbfad075f72',
'consul-template_0.10.0_netbsd_amd64' => '99a7cf3b3bb62968d99d627dc4419f584330484826b3e87f0bfcbe5b5d208c4b',
'consul-template_0.10.0_netbsd_arm' => 'da81d8bfbcb230e8492129dc0d2c5d50e1db651efdce355ec9697f20d8442b2a',
'consul-template_0.10.0_openbsd_386' => '7672b647c9af37e04513ddd4103856644361d20a8ab2a57ea0178f421db01a31',
'consul-template_0.10.0_openbsd_amd64' => 'af978a312dbae326e5aab2566d8a2549aae2910986580e4895fa276fffa98513',
'consul-template_0.10.0_windows_386' => '6611d9aa5bd9ae39d93690cbedb2bc8b57427dfe5a79774346292903282b698f',
'consul-template_0.10.0_windows_amd64' => 'cf88397f3abf6b1e6064672d0535db5d94ced04332e56a1f31f9a2456f30a041',
```

Just copy and paste it to the bottom of the hash in `attributes/checksums.rb` and that's it.
