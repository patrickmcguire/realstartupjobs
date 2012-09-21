require 'spec_helper'

describe "scraped_jobs/edit" do
  before(:each) do
    @scraped_job = assign(:scraped_job, stub_model(ScrapedJob,
      :title => "MyString",
      :company_id => 1,
      :title => "MyString",
      :url => "MyString",
      :description => "MyText",
      :experience_required => "MyString",
      :source => "MyString",
      :source_unique_id => "MyString"
    ))
  end

  it "renders the edit scraped_job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scraped_jobs_path(@scraped_job), :method => "post" do
      assert_select "input#scraped_job_title", :name => "scraped_job[title]"
      assert_select "input#scraped_job_company_id", :name => "scraped_job[company_id]"
      assert_select "input#scraped_job_title", :name => "scraped_job[title]"
      assert_select "input#scraped_job_url", :name => "scraped_job[url]"
      assert_select "textarea#scraped_job_description", :name => "scraped_job[description]"
      assert_select "input#scraped_job_experience_required", :name => "scraped_job[experience_required]"
      assert_select "input#scraped_job_source", :name => "scraped_job[source]"
      assert_select "input#scraped_job_source_unique_id", :name => "scraped_job[source_unique_id]"
    end
  end
end
