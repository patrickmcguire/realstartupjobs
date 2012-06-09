require 'spec_helper'

describe "saved_companies/new" do
  before(:each) do
    assign(:saved_company, stub_model(SavedCompany,
      :user_id => 1,
      :company_id => 1
    ).as_new_record)
  end

  it "renders new saved_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => saved_companies_path, :method => "post" do
      assert_select "input#saved_company_user_id", :name => "saved_company[user_id]"
      assert_select "input#saved_company_company_id", :name => "saved_company[company_id]"
    end
  end
end
