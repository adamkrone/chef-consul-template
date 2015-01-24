require 'spec_helper'

describe 'consul-template::install_binary' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes ark::default' do
    expect(chef_run).to include_recipe('ark::default')
  end

  it 'downloads consul-template' do
    expect(chef_run).to cherry_pick_ark('consul-template')
  end

  it 'creates the consul-template executable' do
    expect(chef_run).to touch_file('/usr/local/bin/consul-template')
  end
end
