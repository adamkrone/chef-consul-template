require 'spec_helper'

describe 'consul-template::install_source' do
  let(:chef_run) { ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache').converge(described_recipe) }

  before do
    stub_command("/usr/local/go/bin/go version | grep \"go1.5 \"").and_return('1.5')
  end

  it 'should include golang::default' do
    expect(chef_run).to include_recipe('golang::default')
  end

  it 'should create the hashicorp go directory' do
    expect(chef_run).to create_directory('/opt/go/src/github.com/hashicorp')
  end

  it 'should checkout the consul-template git repo' do
    expect(chef_run).to checkout_git('/opt/go/src/github.com/hashicorp/consul-template')
  end

  it 'should install consul-template with go' do
    expect(chef_run).to install_golang_package('github.com/hashicorp/consul-template')
  end

  it 'should link consul-template to its install directory' do
    expect(chef_run).to create_link('/usr/local/bin/consul-template')
  end
end
