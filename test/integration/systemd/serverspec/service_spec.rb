require 'serverspec'

set :backend, :exec

describe "Systemd" do
  describe service('consul-template') do
    it { should be_enabled }
    it { should be_running }
  end
end
