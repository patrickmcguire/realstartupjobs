class Job < ActiveRecord::Base
  belongs_to :company 
  belongs_to :user
  has_many :saved_jobs
  def company_name
    company.name.to_s
  end
  
  def company_founded
    company.founded.to_s
  end
  
  def company_employees
    company.employees.to_s
  end
  
  def company_funding_string
    company.funding_string.to_s
  end
  
end
