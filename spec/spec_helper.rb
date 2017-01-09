require 'chefspec'
require 'chefspec/berkshelf'
require 'coveralls'

require_relative 'support/matchers'
require_relative '../libraries/consul-template_helpers.rb'

Coveralls.wear!

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.platform = 'ubuntu'
  config.version = '14.04'
end

at_exit { ChefSpec::Coverage.report! }
