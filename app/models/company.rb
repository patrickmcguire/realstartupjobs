class Company < ActiveRecord::Base
  belongs_to :user
  has_many :saved_companies
  has_many :jobs
  #\has_many :saved_jobs
  has_many :company_tags
  has_many :tags, :through => :company_tags
  attr_protected
  has_attached_file :logo,
                    :styles => { :medium => "300x300>",
                                                    :thumb => "100x100>" }
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
  
  def blog_url 
    Crunchbase::Company.get(crunchbase_slug).blog_url unless Crunchbase::Company.get(crunchbase_slug).blog_url.nil? " "
  end
 
  def blog_feed_url 
    if Crunchbase::Company.get(crunchbase_slug).blog_feed_url.nil?
      " "
    else
      Crunchbase::Company.get(crunchbase_slug).blog_feed_url
    end
  end
  
  def number_of_employees 
    if Crunchbase::Company.get(crunchbase_slug).number_of_employees.nil?
      employees
    else
      Crunchbase::Company.get(crunchbase_slug).number_of_employees
    end
  end
  
  def company_overview
  #  if Crunchbase::Company.get(crunchbase_slug).overview.nil?
   #   overview
    #else
      Crunchbase::Company.get(crunchbase_slug).overview
    #end
  end
  
  def twitter_url
     "http://www.twitter.com/"+Crunchbase::Company.get(crunchbase_slug).twitter_username
  end
  def image_url_large
    crunchbase_stem = "http://www.crunchbase.com/"
    
   crunchbase_stem + Crunchbase::Company.get(crunchbase_slug).image['available_sizes'][2][1]    
  end
  def image_url_medium
    Crunchbase::Company.get(crunchbase_slug).image['available_sizes'][1][1]    
  end
  def image_url_small
    Crunchbase::Company.get(crunchbase_slug).image['available_sizes'][0][1]    
  end
end

