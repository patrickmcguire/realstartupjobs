require 'spec_helper'

describe "user_ids/show" do
  before(:each) do
    @user_id = assign(:user_id, stub_model(UserId,
      :company_id => "Company"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company/)
  end
end
