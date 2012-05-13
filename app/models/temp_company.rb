class TempCompany < ActiveRecord::Base
  attr_accessible :Crunchbase_url, :blog_url, :category, :company_hiring_text, :company_jobs_url, :company_name, :company_url, :description, :employees, :founded_month, :founded_year, :homepage_url, :money_raised, :name, :nocrunchbase, :overview, :tag_list, :twitter_name
end
