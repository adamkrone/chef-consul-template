require 'spec_helper'

describe 'consul-template::service' do
  let(:chef_run) { ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache').converge(described_recipe) }

  it 'should create the consul-template config directory' do
    expect(chef_run).to create_directory('/etc/consul-template.d')
  end

  it 'should create the consul-template default config' do
    expect(chef_run).to create_file('/etc/consul-template.d/default.json')
  end

  it 'should enable the consul-template service' do
    expect(chef_run).to enable_poise_service('consul-template')
  end

  context 'when using init' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.3').converge(described_recipe)
    end

    it 'should not create the consul-template service user (using root)' do
      expect(chef_run).to_not create_poise_service_user('root')
        .with(group: 'root')
    end

    it 'should create service with the correct command' do
      expect(chef_run).to enable_poise_service('consul-template')
    end
  end

  context 'when using upstart' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
    end
    it 'should create the consul-template service user' do
      expect(chef_run).to create_poise_service_user('consul-template')
        .with(group: 'consul-template')
    end

    it 'should create service with the correct command' do
      expect(chef_run).to enable_poise_service('consul-template')
        .with(user: 'consul-template')
    end
  end

  context 'when using runit' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['consul_template']['init_style'] = 'runit'
      end.converge(described_recipe)
    end

    it 'should create the consul-template service user' do
      expect(chef_run).to create_poise_service_user('consul-template')
        .with(group: 'consul-template')
    end

    it 'should create service with the correct command' do
      expect(chef_run).to enable_poise_service('consul-template')
        .with(user: 'consul-template')
    end
  end

  context 'when using systemd' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['consul_template']['init_style'] = 'systemd'
      end.converge(described_recipe)
    end

    it 'should create the consul-template service user' do
      expect(chef_run).to create_poise_service_user('consul-template')
        .with(group: 'consul-template')
    end

    it 'should create service with the correct command' do
      expect(chef_run).to enable_poise_service('consul-template')
        .with(user: 'consul-template')
    end
  end
end
