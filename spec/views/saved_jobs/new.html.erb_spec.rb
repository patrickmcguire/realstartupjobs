require 'spec_helper'

describe "saved_jobs/new" do
  before(:each) do
    assign(:saved_job, stub_model(SavedJob,
      :user_id => 1,
      :job_id => 1
    ).as_new_record)
  end

  it "renders new saved_job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => saved_jobs_path, :method => "post" do
      assert_select "input#saved_job_user_id", :name => "saved_job[user_id]"
      assert_select "input#saved_job_job_id", :name => "saved_job[job_id]"
    end
  end
end
