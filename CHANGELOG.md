Consul Template Cookbook Changelog
==================================

## v0.13.0 (December 20th, 2017)

BREAKING CHANGES:

- Removes installing from source. Will probably return at a later date.
- Removes supervisor support.
  ([GH-70](https://github.com/adamkrone/chef-consul-template/issues/70))

IMPROVEMENTS:

- Adds Chef 13 support
  ([GH-70](https://github.com/adamkrone/chef-consul-template/issues/70))
- Updates default version to v0.19.4, adds new checksums
  ([GH-66](https://github.com/adamkrone/chef-consul-template/pull/66))
  ([GH-76](https://github.com/adamkrone/chef-consul-template/pull/76))
- Updates service options
  ([GH-77](https://github.com/adamkrone/chef-consul-template/pull/77))
- Unpins nssm cookbook version
  ([GH-69](https://github.com/adamkrone/chef-consul-template/pull/69))
- Fixes systemd service file permissions
  ([GH-74](https://github.com/adamkrone/chef-consul-template/pull/74))
- Updates test suite OS matrix
- Marks default.json as a sensitive resource
  ([GH-71](https://github.com/adamkrone/chef-consul-template/issues/71))
- Fixes systemd time out on stop/restart
  ([GH-72](https://github.com/adamkrone/chef-consul-template/issues/72))
- Adds configurable environment variables to init templates
  ([GH-79](https://github.com/adamkrone/chef-consul-template/pull/79))
- Reloads systemd after service file changes
  ([GH-68](https://github.com/adamkrone/chef-consul-template/pull/68))

## v0.12.0 (January 11th, 2017)

IMPROVEMENTS:

- Adds initial support for Windows
  ([GH-55](https://github.com/adamkrone/chef-consul-template/pull/55))
- Adds support for supervisor init style
  ([GH-37](https://github.com/adamkrone/chef-consul-template/pull/37))
- Simplifies init style default, which is smarter about defaulting to
  the most appropriate init system for a given OS.
- Adds new configuration values
  ([GH-61](https://github.com/adamkrone/chef-consul-template/pull/61))
- Adds v0.16.0 and v0.18.0-rc1 checksums
  ([GH-62](https://github.com/adamkrone/chef-consul-template/pull/62))
- Updates kitchen suites
- Wraps entire matchers.rb in ChefSpec conditional clause

BUG FIXES:

- Fixes Runit with v0.16.0 and greater
- Fixes various issues in dev tools/testing
  ([GH-63](https://github.com/adamkrone/chef-consul-template/pull/63))

## v0.11.0 (June 21st, 2016)

IMPROVEMENTS:

- Updates default version of consul-template to 0.15.0, adds new checksums
  ([GH-47](https://github.com/adamkrone/chef-consul-template/pull/47))
  ([GH-48](https://github.com/adamkrone/chef-consul-template/pull/48))
  ([GH-53](https://github.com/adamkrone/chef-consul-template/pull/53))
- Adds support for template-specific wait parameter
  ([GH-50](https://github.com/adamkrone/chef-consul-template/pull/50))

BUG FIXES:

- Fixes log level in Upstart template
  ([GH-49](https://github.com/adamkrone/chef-consul-template/pull/49))
- Drops "supports :reload" from runit_service definition
  ([GH-52](https://github.com/adamkrone/chef-consul-template/pull/52))
- Guards issues/source_url in metadata.rb, which is not supported in
  Chef 11

## v0.10.0 (February 25th, 2016)

IMPROVEMENTS:

- Updates default version of consul-template to 0.12.2, updated release
  download location, adds new checksums.
  ([GH-36](https://github.com/adamkrone/chef-consul-template/pull/36))
  ([GH-39](https://github.com/adamkrone/chef-consul-template/pull/39))
  ([GH-41](https://github.com/adamkrone/chef-consul-template/pull/41))

BUG FIXES:

- Fixes issue preventing consul-template from updating existing installs
  ([GH-38](https://github.com/adamkrone/chef-consul-template/issues/38))
- Fixes issue causing a zero-length consul-template file being created in some
  situations
  ([GH-40](https://github.com/adamkrone/chef-consul-template/issues/40))
- Fixes issue introduced in the GH-38 fix that prevented the install_binary
  recipe from running by itself.
  ([GH-43](https://github.com/adamkrone/chef-consul-template/pull/43))
- Uses consul-template service user when using upstart.
  ([GH-45](https://github.com/adamkrone/chef-consul-template/pull/45))

## v0.9.1 (November 19th, 2015)

BUG FIXES:

- Removes quotes around perms in config template
  ([GH-33](https://github.com/adamkrone/chef-consul-template/pull/33))

## v0.9.0 (October 23rd, 2015)

FEATURES:

- Adds delete action for consul_template_config LWRP
  ([GH-30](https://github.com/adamkrone/chef-consul-template/pull/30))

IMPROVEMENTS:

- Allows upstart to be used outside of Ubuntu
  ([GH-29](https://github.com/adamkrone/chef-consul-template/pull/29))
- Updates default version of consul-template to 0.11.0, adds new checksums,
  and handles new zip format
  ([GH-25](https://github.com/adamkrone/chef-consul-template/pull/25))
  ([GH-27](https://github.com/adamkrone/chef-consul-template/pull/27))
  ([GH-32](https://github.com/adamkrone/chef-consul-template/pull/32))

BUG FIXES:

- Notify restart runit_service if such is the init_style
  ([GH-26](https://github.com/adamkrone/chef-consul-template/pull/26))

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
