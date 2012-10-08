class Press < ActiveRecord::Base
  attr_accessible :company_id, :job_id, :snippet, :source, :title, :updated_at, :url
end
