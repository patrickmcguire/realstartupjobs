require 'csv'
require "crunchbase"

desc "Import companies from csv file"
task :fix => [:environment] do
  # file = "db/company3.csv"

  # CSV.foreach(file, :headers => true) do |row|
  companies = Company.all # check to see if the job already exists in the database
years=0
  companies.each do |company|

    if company.crunchbase_slug
      begin
        crunchbase = Crunchbase::Company.get(company.crunchbase_slug)
      rescue
        puts "prob getting crunchbase"
      end
      if crunchbase && crunchbase.founded
    #    if company.founded != crunchbase.founded
          puts company.name.to_s
          puts company.founded
          puts crunchbase.founded
          company.founded = crunchbase.founded
          company.save!
          puts "new year count: " + company.founded.to_s
          years =+ 1
      #  else 
       #   puts "ca"
      #  end
        else 
        puts "ncyf"
       end
            if crunchbase && crunchbase.number_of_employees
        if  company.employees < crunchbase.number_of_employees || company.employees == nil 
          puts company.name.to_s
          puts company.employees
          puts crunchbase.number_of_employees
          company.employees = crunchbase.number_of_employees
          company.save!
          puts "new employee count: " + company.employees.to_s
        else 
          puts "ca"
        end
        else 
        puts "nce"
       end
          else 
        puts "ncs"
      end

  end
  puts years
end
