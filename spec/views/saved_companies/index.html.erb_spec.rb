require 'spec_helper'

describe "saved_companies/index" do
  before(:each) do
    assign(:saved_companies, [
      stub_model(SavedCompany,
        :user_id => 1,
        :company_id => 1
      ),
      stub_model(SavedCompany,
        :user_id => 1,
        :company_id => 1
      )
    ])
  end

  it "renders a list of saved_companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
