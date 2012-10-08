class SkillTag < ActiveRecord::Base
  attr_accessible :angel_tag_url, :angel_tag_id, :crunchbase_tag_id, :crunchbase_tag_url, :description, :is_technical, :name
end
