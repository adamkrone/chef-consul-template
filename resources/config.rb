actions :create, :delete, :add, :remove
default_action :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :templates, :kind_of => Array, :default => []
