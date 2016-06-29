ChefSpec.define_matcher :consul_template_config

def create_consul_template_config(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:consul_template_config, :create, resource_name)
end
