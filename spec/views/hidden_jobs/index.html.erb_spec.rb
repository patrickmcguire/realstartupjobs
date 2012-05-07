require 'spec_helper'

describe "hidden_jobs/index" do
  before(:each) do
    assign(:hidden_jobs, [
      stub_model(HiddenJob,
        :user_id => 1,
        :job_id => 1
      ),
      stub_model(HiddenJob,
        :user_id => 1,
        :job_id => 1
      )
    ])
  end

  it "renders a list of hidden_jobs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
