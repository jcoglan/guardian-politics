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
  
  describe :equality do
    it "is equal to another Candidate with the same ID" do
      candidate.should == Guardian::Politics::Candidate.new(Object.new, {"aristotle-id" => 6299})
    end
    
    it "is not equal to another Candidate with a different ID" do
      candidate.should_not == Guardian::Politics::Candidate.new(Object.new, {"aristotle-id" => 6300})
    end
  end
end

