use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :create do
  templates = new_resource.templates.map { |v| Mash.from_hash(v) }

  case node['consul_template']['init_style']
  when 'runit'
    consul_template_user = node['consul_template']['service_user']
    consul_template_group = node['consul_template']['service_group']
  else
    consul_template_user = 'root'
    consul_template_group = 'root'
  end

  # Create entries in configs-template dir but only if it's well formed
  templates.each_with_index do |v, i|
    fail "Missing source for #{i} entry at '#{new_resource.name}" if v[:source].nil?
    fail "Missing destination for #{i} entry at '#{new_resource.name}" if v[:destination].nil?
  end

  template ::File.join(node['consul_template']['config_dir'], new_resource.name) do
    cookbook 'consul-template'
    source 'config-template.json.erb'
    user consul_template_user
    group consul_template_group
    mode node['consul_template']['template_mode']
    variables(:templates => templates)
    not_if { templates.empty? }
  end
end
