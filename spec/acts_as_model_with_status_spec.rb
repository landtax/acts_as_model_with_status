require 'spec_helper'

ActiveRecord::Base.establish_connection( :adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS 'my_models'")
ActiveRecord::Base.connection.create_table(:my_models) do |t|
  t.integer :my_status
  t.timestamps
end

class MyModel < ActiveRecord::Base
end

class BasicModel < MyModel
  acts_as_model_with_status({:new => 1, :running => 2, :done => 3, :closed => 4})
end

class WithDefaultModel < MyModel
  acts_as_model_with_status({:new => 1, :running => 2, :done => 3, :closed => 4}, :default => 2)
end

class WithColumnModel < MyModel
  acts_as_model_with_status({:new => 1, :running => 2, :done => 3, :closed => 4}, :default => 2, :column => :my_status)
end


describe ActsAsModelWithStatus do

  before :each do
    initalize_database
  end

  subject {BasicModel.new}

  it "should return version" do
    ActsAsModelWithStatus::VERSION.should == "0.0.1"
  end

  it "test" do
    subject.should_not be_nil


  end




end
