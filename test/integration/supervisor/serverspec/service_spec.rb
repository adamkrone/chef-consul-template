require 'serverspec'

set :backend, :exec

describe 'supervisor' do
  describe command('supervisorctl status consul-template') do
    its(:stdout) { should match(/consul-template/) }
    its(:exit_status) { should eq 0 }
  end
end
