require 'spec_helper'

describe "press_mentions/new" do
  before(:each) do
    assign(:press_mention, stub_model(PressMention,
      :title => "MyString",
      :snippet => "MyText",
      :url => "MyString",
      :source => "MyString",
      :company_id => "MyString",
      :job_id => "MyString"
    ).as_new_record)
  end

  it "renders new press_mention form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => press_mentions_path, :method => "post" do
      assert_select "input#press_mention_title", :name => "press_mention[title]"
      assert_select "textarea#press_mention_snippet", :name => "press_mention[snippet]"
      assert_select "input#press_mention_url", :name => "press_mention[url]"
      assert_select "input#press_mention_source", :name => "press_mention[source]"
      assert_select "input#press_mention_company_id", :name => "press_mention[company_id]"
      assert_select "input#press_mention_job_id", :name => "press_mention[job_id]"
    end
  end
end
