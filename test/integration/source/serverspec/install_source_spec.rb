require 'serverspec'

set :backend, :exec

describe "Install from source" do
  describe file('/usr/local/bin/consul-template') do
    it { should be_file }
    it { should be_executable }
  end
end
