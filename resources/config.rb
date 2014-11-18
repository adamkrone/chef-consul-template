actions :create
default_action :create if defined?(default_action)

def initialize(*args)
  super
  @action = :create
end

attribute :name, :kind_of => String, :name_attribute => true
attribute :templates, :kind_of => Array, :default => []
