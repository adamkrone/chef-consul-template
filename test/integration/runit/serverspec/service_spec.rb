require 'serverspec'

set :backend, :exec

describe "Runit Service" do
  describe command('pgrep consul-template') do
    its(:exit_status) { should eq 0 }
  end
end
