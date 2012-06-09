require 'spec_helper'

describe "saved_companies/edit" do
  before(:each) do
    @saved_company = assign(:saved_company, stub_model(SavedCompany,
      :user_id => 1,
      :company_id => 1
    ))
  end

  it "renders the edit saved_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => saved_companies_path(@saved_company), :method => "post" do
      assert_select "input#saved_company_user_id", :name => "saved_company[user_id]"
      assert_select "input#saved_company_company_id", :name => "saved_company[company_id]"
    end
  end
end
