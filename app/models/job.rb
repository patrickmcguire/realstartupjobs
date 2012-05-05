class Job < ActiveRecord::Base
  belongs_to :company
  attr_accessible :company_id, :technical, :title, :type, :url, :company
end
