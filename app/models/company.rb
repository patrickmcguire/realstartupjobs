class Company < ActiveRecord::Base
  has_many :jobs
  has_many :company_tags
  has_many :tags, :through => :company_tags
  attr_accessible :Crunchbase_url, :blog_url, :category, :company_hiring_text, :company_jobs_url, :company_name, :company_url, :description, :employees, :founded_month, :founded_year, :homepage_url, :money_raised, :name, :nocrunchbase, :overview, :tag_list, :twitter_name
  
  def funding_string
    return nil if funding.nil?
    if funding > 1000000
      '$' + (funding / 1000000.0).to_s + 'M'
    elsif funding > 1000
      '$' + (funding / 1000.0).to_s + 'K'
    else
      '$' + funding.to_s
    end
  end
end