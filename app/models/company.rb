class Company < ActiveRecord::Base
  has_many :jobs
  attr_accessible :employees, :funding, :name, :url, :jobs, :description, :funding_string
  
  def funding_string
    if funding > 1000000
      '$' + (funding / 1000000.0).to_s + 'M'
    elsif funding > 1000
      '$' + (funding / 1000.0).to_s + 'K'
    else
      '$' + funding.to_s
    end
  end
end