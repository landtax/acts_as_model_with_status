require 'spec_helper'

ActiveRecord::Base.send(:extend, ActsAsModelWithStatus::Hook)

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
    initialize_database
  end

  describe "Handle status" do
    subject { BasicModel.new }

    its (:status) { be_nil }

    it "must update status" do
      subject.status = :new
      subject.status.should == :new
    end

  end


end
