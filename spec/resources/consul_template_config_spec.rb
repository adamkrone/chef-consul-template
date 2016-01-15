require 'spec_helper'

describe 'consul_template_config resource' do
  let(:example_recipe) { 'consul-template-spec::consul_template_config' }
  let(:chef_run) { ChefSpec::SoloRunner.new(step_into: ['consul_template_config'], file_cache_path: '/var/chef/cache').converge(example_recipe) }

  describe 'create' do
    it 'should create the consul_template_config' do
      expect(chef_run).to create_consul_template_config('test')
    end

    it 'should create the config file' do
      expect(chef_run).to create_template('/etc/consul-template.d/test')
    end

    it 'should create the ctmplfile' do
      expect(chef_run).to create_template('/tmp/test.config.ctmpl')
    end

    it 'should add the test key/value' do
      expect(chef_run).to run_execute('add test key/value')
    end
  end
end
