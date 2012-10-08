require 'spec_helper'

describe "jobs_tags/edit" do
  before(:each) do
    @jobs_tag = assign(:jobs_tag, stub_model(JobsTag,
      :tag_id => 1,
      :job_id => 1
    ))
  end

  it "renders the edit jobs_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jobs_tags_path(@jobs_tag), :method => "post" do
      assert_select "input#jobs_tag_tag_id", :name => "jobs_tag[tag_id]"
      assert_select "input#jobs_tag_job_id", :name => "jobs_tag[job_id]"
    end
  end
end
