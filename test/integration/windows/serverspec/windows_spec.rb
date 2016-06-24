require 'serverspec'

set :backend, :cmd
set :os, family: 'windows'

describe 'Сonsul template service' do
  it 'has an executable file' do
    expect(file(
             'C:\\Program Files\\consul_template\\consul-template_0.15.0_windows_amd64\\consul-template.exe'
    )).to exist
  end

  it 'has a configuration file' do
    expect(file('C:\\Program Files\\consul_template\\consul_template.d\\default.json')).to be_file
  end

  it 'is running as a service' do
    expect(service('consul_template')).to be_running
  end

  it 'is enabled as a service' do
    expect(service('consul_template')).to have_start_mode('Automatic')
  end
end

describe 'consul_template_config LWRP' do
  it 'has a configuration file' do
    expect(file(
             'C:\\Program Files\\consul_template\\consul_template.d\\test'
    )).to be_file
    expect(file(
             'C:\\Program Files\\consul_template\\consul_template.d\\test'
    )).to contain 'source = "C:/test.config.ctmpl"'
    expect(file(
             'C:\\Program Files\\consul_template\\consul_template.d\\test'
    )).to contain 'destination = "C:/test.config"'
  end

  it 'executed trigger command' do
    expect(file('C:\\consul-template-command-test')).to be_file
  end
end
