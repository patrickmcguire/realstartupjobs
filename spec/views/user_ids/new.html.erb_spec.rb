require 'spec_helper'

describe "user_ids/new" do
  before(:each) do
    assign(:user_id, stub_model(UserId,
      :company_id => "MyString"
    ).as_new_record)
  end

  it "renders new user_id form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_ids_path, :method => "post" do
      assert_select "input#user_id_company_id", :name => "user_id[company_id]"
    end
  end
end
