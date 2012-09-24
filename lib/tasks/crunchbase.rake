require 'csv'
require "crunchbase"

desc "Import companies from csv file"
task :crunchbase => [:environment] do
  file = "db/company3.csv"

  CSV.foreach(file, :headers => true) do |row|
  exists = Company.find(:all, :conditions => {:crunchbase_slug => row[3]}) # check to see if the job already exists in the database
  if exists.count == 0   #if the job exists, update it



    crunchbase = Crunchbase::Company.get(row[3])

      if crunchbase
          if crunchbase.total_money_raised
            money_raised = crunchbase.total_money_raised
          else
            money_raised = "n/a"
          end
          if crunchbase.number_of_employees
            number_of_employees = crunchbase.number_of_employees
          else
            number_of_employees = "0"
          end
          if crunchbase.description
            description = crunchbase.description
          else description = "n/a"
          end
          if crunchbase.overview
            overview = crunchbase.overview
          else overview = "n/a"
          end
          if crunchbase.twitter_username
            twitter_username = crunchbase.twitter_username
          else
            twitter_username = "n/a"
          end
          if crunchbase.blog_url
            blog_url = crunchbase.blog_url
          else
            blog_url = "n/a"
          end
          if crunchbase.funding_rounds
            funding_rounds = crunchbase.funding_rounds.count
          else funding_rounds = 0
          end
          if crunchbase.deadpooled_url
            deadpooled_url = crunchbase.deadpooled_url
          else
            deadpooled_url = "n/a"
          end
          if crunchbase.founded
            founded = crunchbase.founded
          else
            founded = ""
          end

          Company.create ({

            :name => row[0],

            :url => row[1],
            :jobs_url => row[2],
            :description => description,
            :founded => crunchbase.founded,
            :employees => number_of_employees.to_s,
            :funding_string => money_raised,
            :crunchbase_slug => row[3],
            :funding_rounds => funding_rounds,
            :overview => overview,
            :twitter_name => twitter_username,
            :blog_url => blog_url


          })
          puts row[0]
          puts number_of_employees
          puts "completed"
          sleep(1/10)
        else
          puts row[0]

          "skipped"
      end
    end
  end
end