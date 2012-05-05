class Company < ActiveRecord::Base
  has_many :jobs
  attr_accessible :employees, :funding, :name, :url, :jobs
end
