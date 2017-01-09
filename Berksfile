source 'https://supermarket.chef.io'

metadata

cookbook 'apt'
cookbook 'consul'
cookbook 'libarchive'
cookbook 'supervisor'

group :test do
  cookbook 'consul-template-spec', path: 'spec/fixtures/cookbooks/consul-template-spec'
end
