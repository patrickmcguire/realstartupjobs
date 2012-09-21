class Job < ActiveRecord::Base
  belongs_to :company 
  belongs_to :user
  has_many :saved_jobs
attr_accessible :id, :company_id, :title, :url, :technical, :internship, :created_at, :updated_at, :last_updated, :description, :date_posted, :last_checked, :experience_required, :kind, :source, :source_unique_id, :approved
  
  def company_stage
    company.stage
  end
  
  def company_stage=(stage)
    @company_stage
  end
  
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
  def internship_flag
    if internship == true
			"internship"
		else 
			"job"
		end
	end
	def technical_flag
	  if technical == true
	    "technical"
	  else
	    "non-technical"
	  end
	end
end
  