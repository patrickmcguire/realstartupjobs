require 'spec_helper'

describe "skill_tags/index" do
  before(:each) do
    assign(:skill_tags, [
      stub_model(SkillTag,
        :name => "Name",
        :description => "MyText",
        :angel_tag_id => 1,
        :agel_tag_url => "Agel Tag Url",
        :crunchbase_tag_id => 2,
        :crunchbase_tag_url => "Crunchbase Tag Url",
        :is_technical => false
      ),
      stub_model(SkillTag,
        :name => "Name",
        :description => "MyText",
        :angel_tag_id => 1,
        :agel_tag_url => "Agel Tag Url",
        :crunchbase_tag_id => 2,
        :crunchbase_tag_url => "Crunchbase Tag Url",
        :is_technical => false
      )
    ])
  end

  it "renders a list of skill_tags" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Agel Tag Url".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Crunchbase Tag Url".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
