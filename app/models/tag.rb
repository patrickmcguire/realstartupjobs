class Tag < ActiveRecord::Base
  attr_accessible :tag
  has_many :company_tags
  has_many :tags, :through => :company_tags
end
