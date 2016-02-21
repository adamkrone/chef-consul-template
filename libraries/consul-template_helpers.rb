class Chef::Recipe::ConsulTemplateHelpers
  class << self
    def install_checksum(node)
      node['consul_template']['checksums'].fetch(install_version(node))
    end

    def install_extension
      '.zip'
    end

    def install_file(node)
      install_version(node) + install_extension
    end

    def install_version(node)
      ['consul-template',
       node['consul_template']['version'],
       node['os'],
       install_arch(node['kernel']['machine'])
      ].join('_')
    end

    private

    def install_arch(machine_arch)
      machine_arch =~ /x86_64/ ? 'amd64' : '386'
    end
  end
end
