require 'spec_helper'

describe "press_mentions/index" do
  before(:each) do
    assign(:press_mentions, [
      stub_model(PressMention,
        :title => "Title",
        :snippet => "MyText",
        :url => "Url",
        :source => "Source",
        :company_id => "Company",
        :job_id => "Job"
      ),
      stub_model(PressMention,
        :title => "Title",
        :snippet => "MyText",
        :url => "Url",
        :source => "Source",
        :company_id => "Company",
        :job_id => "Job"
      )
    ])
  end

  it "renders a list of press_mentions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Job".to_s, :count => 2
  end
end
