require 'serverspec'

set :backend, :exec


describe "consul_template_config LWRP" do
  describe file('/etc/consul-template.d/test') do
    it { should be_file }
    it { should contain 'source = "/tmp/test.config.ctmpl"' }
    it { should contain 'destination = "/tmp/test.config"' }
  end
end
