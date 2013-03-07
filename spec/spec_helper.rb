$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'active_record'
require 'active_support'
require 'acts_as_model_with_status'
require 'rspec'
require 'rspec/autorun'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'
end

def initialize_database
  ActiveRecord::Base.establish_connection( :adapter => "sqlite3", :database => ":memory:")
  ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS 'my_models'")
  ActiveRecord::Base.connection.create_table(:my_models) do |t|
    t.integer :my_status
    t.integer :status
    t.timestamps
  end
end

initialize_database
