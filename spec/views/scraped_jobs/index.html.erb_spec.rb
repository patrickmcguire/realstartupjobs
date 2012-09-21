require 'spec_helper'

describe "scraped_jobs/index" do
  before(:each) do
    assign(:scraped_jobs, [
      stub_model(ScrapedJob,
        :title => "Title",
        :company_id => 1,
        :title => "Title",
        :url => "Url",
        :description => "MyText",
        :experience_required => "Experience Required",
        :source => "Source",
        :source_unique_id => "Source Unique"
      ),
      stub_model(ScrapedJob,
        :title => "Title",
        :company_id => 1,
        :title => "Title",
        :url => "Url",
        :description => "MyText",
        :experience_required => "Experience Required",
        :source => "Source",
        :source_unique_id => "Source Unique"
      )
    ])
  end

  it "renders a list of scraped_jobs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Experience Required".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "Source Unique".to_s, :count => 2
  end
end
