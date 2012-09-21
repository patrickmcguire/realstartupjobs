require 'spec_helper'

describe "scrapers/edit" do
  before(:each) do
    @scraper = assign(:scraper, stub_model(Scraper,
      :title => "MyString",
      :company_id => 1,
      :title => "MyString",
      :url => "MyString",
      :description => "MyText",
      :experience_required => "MyString",
      :date_pos => "MyString"
    ))
  end

  it "renders the edit scraper form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scrapers_path(@scraper), :method => "post" do
      assert_select "input#scraper_title", :name => "scraper[title]"
      assert_select "input#scraper_company_id", :name => "scraper[company_id]"
      assert_select "input#scraper_title", :name => "scraper[title]"
      assert_select "input#scraper_url", :name => "scraper[url]"
      assert_select "textarea#scraper_description", :name => "scraper[description]"
      assert_select "input#scraper_experience_required", :name => "scraper[experience_required]"
      assert_select "input#scraper_date_pos", :name => "scraper[date_pos]"
    end
  end
end
