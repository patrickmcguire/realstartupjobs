class SavedJob < ActiveRecord::Base
  attr_accessible :job_id, :user_id
  has_many :jobs
end
