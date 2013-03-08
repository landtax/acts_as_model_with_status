require 'spec_helper'

ActiveRecord::Base.send(:extend, ActsAsModelWithStatus::Hook)

STATUS_LIST = {:new => 1, :running => 2, :done => 3, :closed => 4}

class MyModel < ActiveRecord::Base
end

class BasicModel < MyModel
  acts_as_model_with_status(STATUS_LIST)
end

class WithDefaultModel < MyModel
  acts_as_model_with_status(STATUS_LIST, :default => :running)
end

class WithColumnModel < MyModel
  acts_as_model_with_status(STATUS_LIST, :default => :running, :column => :my_status)
end


describe ActsAsModelWithStatus do

  before :each do
    initialize_database
  end

  describe "Status operations" do
    subject { BasicModel.new }

    its(:status_culumn) { eq :status}
    its(:default_status) {be_nil}
    its (:status) { be_nil }

    it "must update status" do
      STATUS_LIST.each do |k,v| 
        subject.status = k
        subject.save

        subject.reload
        subject.status.should == k
      end
    end

    it "must raise an exception when status is not in list" do
      expect{subject.status = :fake_status}.to raise_exception
    end

  end

  describe "Initialize Status with default value" do
    subject { WithDefaultModel.new }

    its(:status_culumn) { eq :status}
    its(:default_status) {eq :running}
    its(:status) {eq  :running }

  end

  describe "Use custom column name" do
    subject { WithColumnModel.new }

    its(:status_culumn) {eq :my_status}
    its(:default_status) {eq :running}

    it "must initialize status" do
      subject.status.should == :running
    end

    it "does not store value in default column name but in custom column name" do
      subject.save
      subject.reload
      subject.read_attribute(:status).should be_nil
      subject.read_attribute(:my_status).should == 2

      subject.status = :new
      subject.save
      subject.reload
      subject.read_attribute(:status).should be_nil
      subject.read_attribute(:my_status).should == 1
    end

  end


end
