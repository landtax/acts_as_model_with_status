require 'rails'
require 'active_record'
require 'acts_as_model_with_status'

p "Railtie loaded"

begin
  module ActsAsModelWithStatus
    class Railtie < Rails::Railtie
      config.to_prepare do
        p "hook added"
        ActiveRecord::Base.send(:extend, ActsAsModelWithStatus::Hook)
      end
    end
  end
rescue
  p $!, $!.message
  raise $!
end
