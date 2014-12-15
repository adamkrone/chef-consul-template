source "https://api.berkshelf.com"

metadata

cookbook 'apt'
cookbook 'consul', github: 'johnbellone/consul-cookbook', ref: '553d25f945eb1707db6b863766226d71e0a3c6d8'
cookbook 'consul-test-helpers', github: 'adamkrone/chef-consul-test-helpers'

group :test do
  cookbook 'consul-template-spec', path: 'spec/fixtures/cookbooks/consul-template-spec'
end
