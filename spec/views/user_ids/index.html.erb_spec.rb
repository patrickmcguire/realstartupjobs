require 'spec_helper'

describe "user_ids/index" do
  before(:each) do
    assign(:user_ids, [
      stub_model(UserId,
        :company_id => "Company"
      ),
      stub_model(UserId,
        :company_id => "Company"
      )
    ])
  end

  it "renders a list of user_ids" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company".to_s, :count => 2
  end
end
