class Company < ActiveRecord::Base
  belongs_to :user
  has_many :saved_companies
  has_many :jobs
  #\has_many :saved_jobs
  has_many :company_tags
  has_many :tags, :through => :company_tags
  
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