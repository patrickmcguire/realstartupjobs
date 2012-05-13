class Job < ActiveRecord::Base
  belongs_to :company
  attr_accessible :company_id, :technical, :title, :type, :url, :company, :type_string, :company_name,
    :company_founded, :company_employees, :company_funding_string
  
  def type_string
    type == 0 ? 'Internship' : 'Job'
  end
  
  def company_name
    company.name
  end
  
  def company_founded
    company.founded
  end
  
  def company_employees
    company.employees
  end
  
  def company_funding_string
    company.funding_string
  end
end
