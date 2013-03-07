require "acts_as_model_with_status/version"
require 'active_support/core_ext'

require File.join(File.dirname(__FILE__), "acts_as_model_with_status/railtie.rb")

module ActsAsModelWithStatus
  autoload :Hook, File.join(File.dirname(__FILE__), "acts_as_model_with_status/hook")
  autoload :InstanceMethods, File.join(File.dirname(__FILE__), "acts_as_model_with_status/instance_methods")
end

