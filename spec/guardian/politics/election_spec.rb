require 'spec_helper'

describe Guardian::Politics::Election do
  let(:election) { Guardian::Politics.elections.first }
  
  it "has a year" do
    election.year.should == 2010
  end
end

