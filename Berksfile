source "https://api.berkshelf.com"

metadata

cookbook 'apt'
cookbook 'consul', github: 'johnbellone/consul-cookbook'

group :test do
  cookbook 'consul-template-spec', path: 'spec/fixtures/cookbooks/consul-template-spec'
end
