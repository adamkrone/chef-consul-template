require 'spec_helper'

describe 'consul-template::install_binary' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'includes ark::default' do
    expect(chef_run).to include_recipe('ark::default')
  end
end
