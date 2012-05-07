require 'spec_helper'

describe "saved_jobs/show" do
  before(:each) do
    @saved_job = assign(:saved_job, stub_model(SavedJob,
      :user_id => 1,
      :job_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
