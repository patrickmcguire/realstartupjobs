require 'spec_helper'

describe "PressMentions" do
  describe "GET /press_mentions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get press_mentions_path
      response.status.should be(200)
    end
  end
end
