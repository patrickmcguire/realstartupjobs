require 'spec_helper'

describe "presses/new" do
  before(:each) do
    assign(:press, stub_model(Press,
      :title => "MyString",
      :snippet => "MyText",
      :url => "MyString",
      :source => "MyString",
      :company_id => "MyString",
      :job_id => "MyString"
    ).as_new_record)
  end

  it "renders new press form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => presses_path, :method => "post" do
      assert_select "input#press_title", :name => "press[title]"
      assert_select "textarea#press_snippet", :name => "press[snippet]"
      assert_select "input#press_url", :name => "press[url]"
      assert_select "input#press_source", :name => "press[source]"
      assert_select "input#press_company_id", :name => "press[company_id]"
      assert_select "input#press_job_id", :name => "press[job_id]"
    end
  end
end
