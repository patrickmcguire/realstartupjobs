class ScrapedJob < ActiveRecord::Base
  attr_accessible :company_id, :date_posted, :description, :experience_required, :last_checked, :source, :source_unique_id, :title, :title, :url
end
