require 'spec_helper'

describe "saved_companies/show" do
  before(:each) do
    @saved_company = assign(:saved_company, stub_model(SavedCompany,
      :user_id => 1,
      :company_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
