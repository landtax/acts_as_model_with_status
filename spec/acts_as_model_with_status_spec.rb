require 'spec_helper'

describe ActsAsModelWithStatus do

  it "should return version" do
    ActsAsModelWithStatus::VERSION.should == "0.0.1"
  end

end
