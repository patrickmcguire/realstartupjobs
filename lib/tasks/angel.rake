require 'open-uri'
require "nokogiri"
require 'indeed'
require 'json'
require 'paperclip'
Indeed.key = 9573432793094543;
def is_internship(title)
  if (title.to_s =~ /intern|internship/i)
    return 1
  else
    return 0
  end
end

desc "test"
task :testing => [:environment] do

  companies = Company.all
  companies.each do |company|
    company_name = company.name.to_s
    if company.angel_id
      # company_url = company.url.to_s.downcase.gsub('http://','').gsub('www.','').gsub('https://','').gsub(/com\/+\z/,'com').
      #   puts company_name
     # company_url = URI.parse(company.url.to_s).host
   
      
        angel = JSON.parse(open("https://api.angel.co/1/startups/"+company.angel_id.to_s).read)
        angel_id = angel["id"]
        twitter = angel["twitterl_url"]
        description = angel["high_concept"]
        logo_url = angel["logo_url"]
        thumb_url = angel["thumb_url"]
        angellist_url = angel["angellist_url"]
        markets = angel["markets"]
        p = Company.find(company.id)
        if logo_url
                p.angel_logo_url = logo_url.to_s
        p.angel_thumb_url = thumb_url.to_s
      end
        if !p.twitter_name && twitter
          p.twitter_name = twitter.gsub('http://twitter.com/','')
        end
        if !p.blog_url && angel["blog_url"]
          p.blog_url = angel["blog_url"]

        end

        if p.description.to_s.length < 3
          p.description = description
        end 
      p.angel_id = angel_id
      p.save!
        puts company.name.to_s + " saved"
         
    end
     #    angel_id = ""
   #   puts angel_url["id"]
      #  Company.find(:id=> company.id)

  end
end

