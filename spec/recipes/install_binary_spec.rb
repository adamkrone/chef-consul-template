require 'spec_helper'

describe 'consul-template::install_binary' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(file_cache_path: '/var/chef/cache')
                        .converge('consul-template::default')
  end
  let(:consul_template_zip) { "consul-template_#{chef_run.node['consul_template']['version']}_linux_amd64.zip" }

  it 'includes libarchive::default' do
    expect(chef_run).to include_recipe('libarchive::default')
  end

  it 'downloads consul-template' do
    downloaded_file = "#{Chef::Config['file_cache_path']}/#{consul_template_zip}"
    expect(chef_run).to create_remote_file_if_missing(downloaded_file)
  end

  it 'extracts consul-template' do
    expect(chef_run).to extract_libarchive_file(consul_template_zip)
  end

  it 'symlinks to /usr/local/bin/consul-template' do
    expect(chef_run).to create_link('/usr/local/bin/consul-template')
  end
end
