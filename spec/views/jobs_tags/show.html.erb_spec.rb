require 'spec_helper'

describe "jobs_tags/show" do
  before(:each) do
    @jobs_tag = assign(:jobs_tag, stub_model(JobsTag,
      :tag_id => 1,
      :job_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
