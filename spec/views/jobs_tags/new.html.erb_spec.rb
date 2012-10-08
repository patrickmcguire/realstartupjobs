require 'spec_helper'

describe "jobs_tags/new" do
  before(:each) do
    assign(:jobs_tag, stub_model(JobsTag,
      :tag_id => 1,
      :job_id => 1
    ).as_new_record)
  end

  it "renders new jobs_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jobs_tags_path, :method => "post" do
      assert_select "input#jobs_tag_tag_id", :name => "jobs_tag[tag_id]"
      assert_select "input#jobs_tag_job_id", :name => "jobs_tag[job_id]"
    end
  end
end
