require 'spec_helper'

describe "press_mentions/edit" do
  before(:each) do
    @press_mention = assign(:press_mention, stub_model(PressMention,
      :title => "MyString",
      :snippet => "MyText",
      :url => "MyString",
      :source => "MyString",
      :company_id => "MyString",
      :job_id => "MyString"
    ))
  end

  it "renders the edit press_mention form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => press_mentions_path(@press_mention), :method => "post" do
      assert_select "input#press_mention_title", :name => "press_mention[title]"
      assert_select "textarea#press_mention_snippet", :name => "press_mention[snippet]"
      assert_select "input#press_mention_url", :name => "press_mention[url]"
      assert_select "input#press_mention_source", :name => "press_mention[source]"
      assert_select "input#press_mention_company_id", :name => "press_mention[company_id]"
      assert_select "input#press_mention_job_id", :name => "press_mention[job_id]"
    end
  end
end
