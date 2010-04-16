require 'spec_helper'

describe Guardian::Politics::Candidate do
  let(:candidate) do
    Guardian::Politics.elections.first.constituencies.first.candidates[1]
  end
  
  it "belongs to a constituency" do
    candidate.constituency.name.should == "Aberavon"
  end
  
  it "has a name" do
    candidate.name.should == "Hywel Francis"
  end
  
  it "belongs to a party" do
    candidate.party_name.should == "Labour"
  end
  
  it "has a list of candidacies" do
    candidate.candidacies.should be_kind_of(Array)
    candidate.candidacies.size.should == 3
  end
end

