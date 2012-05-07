require 'spec_helper'

describe "hidden_jobs/new" do
  before(:each) do
    assign(:hidden_job, stub_model(HiddenJob,
      :user_id => 1,
      :job_id => 1
    ).as_new_record)
  end

  it "renders new hidden_job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hidden_jobs_path, :method => "post" do
      assert_select "input#hidden_job_user_id", :name => "hidden_job[user_id]"
      assert_select "input#hidden_job_job_id", :name => "hidden_job[job_id]"
    end
  end
end
