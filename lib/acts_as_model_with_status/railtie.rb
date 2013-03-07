require 'rails'
require 'active_record'
require 'acts_as_model_with_status'

begin
  module ActsAsModelWithStatus
    class Railtie < Rails::Railtie
      config.to_prepare do
        ActiveRecord::Base.send(:extend, ActsAsModelWithStatus::Hook)
      end
    end
  end
rescue
  p $!, $!.message
  raise $!
end
