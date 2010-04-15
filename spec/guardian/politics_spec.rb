require 'spec_helper'

describe Guardian::Politics do
  let(:politics) { Guardian::Politics }
  
  describe :elections do
    let(:elections) { politics.elections }
    
    it "returns a list of Elections" do
      elections.should be_kind_of(Array)
      elections.size.should == 5
      elections.should(be_all { |e| Guardian::Politics::Election === e })
    end
  end
end

