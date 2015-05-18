require 'spec_helper'

describe 'consul_template_config resource' do
  let(:example_recipe) { 'consul-template-spec::consul_template_config' }
  let(:chef_run) { ChefSpec::SoloRunner.new(step_into: ['consul_template_config']).converge(example_recipe) }

  describe 'create' do
    it 'should create the consul_template_config' do
      expect(chef_run).to create_consul_template_config('haproxy')
    end

    it 'should create the config file' do
      expect(chef_run).to create_template('/etc/consul-template.d/haproxy')
    end
  end
end
