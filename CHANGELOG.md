Consul Template Cookbook Changelog
==================================

## v0.6.5 (February 5th, 2015)

BUG FIXES:

- Assigns ownership of config files to the service user when using runit
  ([GH-10](https://github.com/adamkrone/chef-consul-template/pull/10))

IMPROVEMENTS:

- Redirect stderr to stdout in the consul-template runner so that the runit
  logger gets the log data
  ([GH-11](https://github.com/adamkrone/chef-consul-template/pull/11))
- Allow the `consul_template.log_level` attribute to control the log level used
  by consul when managed by runit
  ([GH-11](https://github.com/adamkrone/chef-consul-template/pull/11))
- Dramatically improves ChefSpec test speed by switching to SoloRunner
- Switch to JSON dump for default.json config file
  ([GH-12](https://github.com/adamkrone/chef-consul-template/pull/12))
- Updates default version of consul-template to 0.6.5 and adds new checksums
  ([GH-13](https://github.com/adamkrone/chef-consul-template/pull/13))

## v0.6.0 (January 23, 2015)

BREAKING CHANGES:

- consul_template_config no longer notifies consul-template to reload from
  inside the LWRP
  ([GH-8](https://github.com/adamkrone/chef-consul-template/pull/8))

IMPROVEMENTS:

- Updates default version to 0.6.0 and adds checksums
  ([GH-9](https://github.com/adamkrone/chef-consul-template/pull/9))
- Adds usage message to generate-checksums script when no version is specified
  ([GH-9](https://github.com/adamkrone/chef-consul-template/pull/9))
