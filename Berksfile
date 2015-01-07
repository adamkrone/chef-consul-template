source "https://api.berkshelf.com"

metadata

cookbook 'apt'
cookbook 'consul', github: 'johnbellone/consul-cookbook'
cookbook 'consul-test-helpers', github: 'adamkrone/chef-consul-test-helpers'

group :test do
  cookbook 'consul-template-spec', path: 'spec/fixtures/cookbooks/consul-template-spec'
end
