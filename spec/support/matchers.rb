def enable_runit_service(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:runit_service, :enable, resource_name)
end

def start_runit_service(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:runit_service, :start, resource_name)
end

def install_golang_package(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:golang_package, :install, resource_name)
end

def create_consul_template_config(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:consul_template_config, :create, resource_name)
end
