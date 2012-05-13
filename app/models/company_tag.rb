class CompanyTag < ActiveRecord::Base
  attr_accessible :company_id, :tag_id
  belongs_to :company
  belongs_to :tag
end
