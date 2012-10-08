require 'spec_helper'

describe "presses/show" do
  before(:each) do
    @press = assign(:press, stub_model(Press,
      :title => "Title",
      :snippet => "MyText",
      :url => "Url",
      :source => "Source",
      :company_id => "Company",
      :job_id => "Job"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
    rendered.should match(/Source/)
    rendered.should match(/Company/)
    rendered.should match(/Job/)
  end
end
