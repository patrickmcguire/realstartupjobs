require 'spec_helper'

describe "scrapers/index" do
  before(:each) do
    assign(:scrapers, [
      stub_model(Scraper,
        :title => "Title",
        :company_id => 1,
        :title => "Title",
        :url => "Url",
        :description => "MyText",
        :experience_required => "Experience Required",
        :date_pos => "Date Pos"
      ),
      stub_model(Scraper,
        :title => "Title",
        :company_id => 1,
        :title => "Title",
        :url => "Url",
        :description => "MyText",
        :experience_required => "Experience Required",
        :date_pos => "Date Pos"
      )
    ])
  end

  it "renders a list of scrapers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Experience Required".to_s, :count => 2
    assert_select "tr>td", :text => "Date Pos".to_s, :count => 2
  end
end
