require 'spec_helper'

describe "hidden_jobs/show" do
  before(:each) do
    @hidden_job = assign(:hidden_job, stub_model(HiddenJob,
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
