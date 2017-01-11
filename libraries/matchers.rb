if defined?(ChefSpec)
  ChefSpec.define_matcher :consul_template_config if defined?(ChefSpec)

  def create_consul_template_config(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:consul_template_config, :create, resource_name)
  end
end
