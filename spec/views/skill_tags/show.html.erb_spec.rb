require 'spec_helper'

describe "skill_tags/show" do
  before(:each) do
    @skill_tag = assign(:skill_tag, stub_model(SkillTag,
      :name => "Name",
      :description => "MyText",
      :angel_tag_id => 1,
      :agel_tag_url => "Agel Tag Url",
      :crunchbase_tag_id => 2,
      :crunchbase_tag_url => "Crunchbase Tag Url",
      :is_technical => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/Agel Tag Url/)
    rendered.should match(/2/)
    rendered.should match(/Crunchbase Tag Url/)
    rendered.should match(/false/)
  end
end
