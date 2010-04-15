require 'spec_helper'

describe Guardian::Politics::Constituency do
  let(:constituency) { Guardian::Politics.elections.first.constituencies.first }
  
  it "belongs to an election" do
    constituency.election.year.should == 2010
  end
  
  it "has a name" do
    constituency.name.should == "Aberavon"
  end
  
  it "has a list of candidates" do
    constituency.candidates.should be_kind_of(Array)
    constituency.candidates.size.should == 6
  end
end

