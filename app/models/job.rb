class Job < ActiveRecord::Base
  belongs_to :company
  
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
