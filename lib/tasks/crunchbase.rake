require 'csv'
require "crunchbase"

desc "Import companies from csv file"
task :crunchbase => [:environment] do
 # file = "db/company3.csv"

 # CSV.foreach(file, :headers => true) do |row|
  companies = Company.all # check to see if the job already exists in the database

  companies.each do |company|
  if company.crunchbase_slug
    begin
    crunchbase = Crunchbase::Company.get(company.crunchbase_slug)
  rescue
    puts "prob getting crunchbase"
  end
      if crunchbase 
          if company.funding_string.to_s.length < 3 && crunchbase.total_money_raised

            company.funding_string = crunchbase.total_money_raised
          elsif  company.funding_string.to_s.length < 3 && company.funding > 1
            company.funding_string = company.funding

          end
          if company.employees == 0 && crunchbase.number_of_employees
            company.employees = crunchbase.number_of_employees
          end
          if crunchbase.description
            description = crunchbase.description
          else description = "n/a"
          end
          if crunchbase.overview
            overview = crunchbase.overview
          else overview = "n/a"
          end
          if crunchbase.twitter_username && company.twitter_name.to_s.length < 2
            company.twitter_name = crunchbase.twitter_username
          else
          end
          if crunchbase.blog_url && company.blog_url.to_s.length < 2
            company.blog_url = crunchbase.blog_url
          else
          end
          if crunchbase.funding_rounds
            funding_rounds = crunchbase.funding_rounds.count
          else funding_rounds = 0
          end
          if crunchbase.founded && company.founded.to_s.length < 3
            company.founded = crunchbase.founded
          end
          begin

          company.save!
          rescue 
            puts  "prob saving"
        end
          puts company.name
          puts company.employees
          puts "completed"
        #  sleep(1/10)
        else
         # puts row[0]

         puts "skipped"
      end
    end
  end
end