require 'spec_helper'

describe Guardian::Politics::Election do
  let(:election) { Guardian::Politics.elections.first }
  
  it "has a year" do
    election.year.should == 2010
  end
  
  it "has a list of constituencies" do
    election.constituencies.should be_kind_of(Array)
    election.constituencies.size.should == 1
  end
end

