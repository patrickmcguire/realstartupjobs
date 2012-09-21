require 'spec_helper'

describe "scrapers/show" do
  before(:each) do
    @scraper = assign(:scraper, stub_model(Scraper,
      :title => "Title",
      :company_id => 1,
      :title => "Title",
      :url => "Url",
      :description => "MyText",
      :experience_required => "Experience Required",
      :date_pos => "Date Pos"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/Url/)
    rendered.should match(/MyText/)
    rendered.should match(/Experience Required/)
    rendered.should match(/Date Pos/)
  end
end
