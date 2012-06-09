require 'spec_helper'

describe "SavedCompanies" do
  describe "GET /saved_companies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get saved_companies_path
      response.status.should be(200)
    end
  end
end
