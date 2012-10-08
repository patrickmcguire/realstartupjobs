require 'spec_helper'

describe "skill_tags/edit" do
  before(:each) do
    @skill_tag = assign(:skill_tag, stub_model(SkillTag,
      :name => "MyString",
      :description => "MyText",
      :angel_tag_id => 1,
      :agel_tag_url => "MyString",
      :crunchbase_tag_id => 1,
      :crunchbase_tag_url => "MyString",
      :is_technical => false
    ))
  end

  it "renders the edit skill_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => skill_tags_path(@skill_tag), :method => "post" do
      assert_select "input#skill_tag_name", :name => "skill_tag[name]"
      assert_select "textarea#skill_tag_description", :name => "skill_tag[description]"
      assert_select "input#skill_tag_angel_tag_id", :name => "skill_tag[angel_tag_id]"
      assert_select "input#skill_tag_agel_tag_url", :name => "skill_tag[agel_tag_url]"
      assert_select "input#skill_tag_crunchbase_tag_id", :name => "skill_tag[crunchbase_tag_id]"
      assert_select "input#skill_tag_crunchbase_tag_url", :name => "skill_tag[crunchbase_tag_url]"
      assert_select "input#skill_tag_is_technical", :name => "skill_tag[is_technical]"
    end
  end
end
