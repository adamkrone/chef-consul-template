require 'serverspec'

set :backend, :exec

describe "Consul Template Service" do
  describe service('consul-template') do
    it { should be_enabled }
    it { should be_running }
  end
end
