require 'spec_helper'

describe "user_ids/edit" do
  before(:each) do
    @user_id = assign(:user_id, stub_model(UserId,
      :company_id => "MyString"
    ))
  end

  it "renders the edit user_id form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_ids_path(@user_id), :method => "post" do
      assert_select "input#user_id_company_id", :name => "user_id[company_id]"
    end
  end
end
