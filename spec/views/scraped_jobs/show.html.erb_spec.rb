require 'spec_helper'

describe "scraped_jobs/show" do
  before(:each) do
    @scraped_job = assign(:scraped_job, stub_model(ScrapedJob,
      :title => "Title",
      :company_id => 1,
      :title => "Title",
      :url => "Url",
      :description => "MyText",
      :experience_required => "Experience Required",
      :source => "Source",
      :source_unique_id => "Source Unique"
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
    rendered.should match(/Source/)
    rendered.should match(/Source Unique/)
  end
end
