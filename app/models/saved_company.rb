class SavedCompany < ActiveRecord::Base
  attr_accessible :company_id, :user_id
  belongs_to :company
  belongs_to :user
end
