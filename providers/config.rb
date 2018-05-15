use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :create do
  templates = new_resource.templates.map { |v| Mash.from_hash(v) }

  case node['consul_template']['init_style']
  when 'runit', 'systemd', 'upstart'
    consul_template_user = node['consul_template']['service_user']
    consul_template_group = node['consul_template']['service_group']
  else
    consul_template_user = 'root'
    consul_template_group = 'root'
  end

  # Create entries in configs-template dir but only if it's well formed
  templates.each_with_index do |v, i|
    raise "Missing source for #{i} entry at '#{new_resource.name}" if v[:source].nil?
    raise "Missing destination for #{i} entry at '#{new_resource.name}" if v[:destination].nil?
  end

  # Ensure config directory exists
  directory node['consul_template']['config_dir'] do
    unless node['platform'] == 'windows'
      user consul_template_user
      group consul_template_group
      mode 0o755
    end
    recursive true
    action :create
  end

  if node['platform'] == 'windows'
    template ::File.join(node['consul_template']['config_dir'], new_resource.name) do
      cookbook 'consul-template'
      source 'config-template-win.json.erb'
      variables(:templates => templates)
      not_if { templates.empty? }
    end
  else
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
end

action :delete do
  file ::File.join(node['consul_template']['config_dir'], new_resource.name) do
    action :delete
  end
end

alias action_add action_create
alias action_remove action_delete
