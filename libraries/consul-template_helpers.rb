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
       install_arch(node['kernel']['machine'])].join('_')
    end

    private

    def install_arch(machine_arch)
      machine_arch.match(/x86_64/) ? 'amd64' : '386'
    end

    # returns windows friendly version of the provided path,
    # ensures backslashes are used everywhere
    # Gently plucked from https://github.com/chef-cookbooks/windows
    def win_friendly_path(path)
      path&.gsub(::File::SEPARATOR, ::File::ALT_SEPARATOR || '\\')
    end

    # Simply using ::File.join was causing several attributes
    # to return strange values in the resources
    # (e.g. "C:/Program Files/\\consul\\data")
    def join_path(*path)
      win_friendly_path(::File.join(path))
    end

    def program_files
      join_path('C:', 'Program Files') +
        (node['kernel']['machine'].match(/x86_64/) ? '' : ' x(86)')
    end

    def config_prefix_path
      join_path(program_files, 'consul')
    end

    def data_path
      join_path(program_files, 'consul', 'data')
    end
  end
end
