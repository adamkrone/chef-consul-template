Consul Template Cookbook Changelog
==================================

## v0.9.0 (Unreleased)

BUG FIXES:

- Notify restart runit_service if such is the init_style
  ([GH-26](https://github.com/adamkrone/chef-consul-template/pull/26))
- Updates default version of consul-template to 0.10.0 and adds new checksums
  ([GH-25](https://github.com/adamkrone/chef-consul-template/pull/25))
  ([GH-27](https://github.com/adamkrone/chef-consul-template/pull/27))

## v0.8.0 (May 18th, 2015)

FEATURES:

- Adds support for systemd
  ([GH-21](https://github.com/adamkrone/chef-consul-template/pull/21))

IMPROVEMENTS:

- Updates default version of consul-template to 0.7.0 and adds new checksums
  ([GH-15](https://github.com/adamkrone/chef-consul-template/pull/15))
- Moves checksums to their own attribute file
  ([GH-16](https://github.com/adamkrone/chef-consul-template/pull/16))
- Ensures config directory exists in LWRP
  ([GH-18](https://github.com/adamkrone/chef-consul-template/pull/18))
- Fixes config directory permissions in LWRP
  ([GH-19](https://github.com/adamkrone/chef-consul-template/issues/19))

## v0.7.0 (February 6th, 2015)

IMPROVEMENTS:

- Adds recipe and support information to metadata.rb
- Released to Chef Supermarket
- Switching to true SemVer. To this point we were matching the version of the
  consul-template project, regardless of the changes to the cookbook itself.

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
