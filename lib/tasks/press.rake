
desc "scrapes jobs from everywhere"
task :angelpress => [:environment] do
  time = Time.now
  companies = Company.all
  companies.each do |company|

    company_name = company.name.to_s
    company_id = company.id
      if company.angel_id && JSON.parse(open("https://api.angel.co/1/press?startup_id="+company.angel_id.to_s).read)
         puts company.angel_id

        source ="angel"
        press_page = JSON.parse(open("https://api.angel.co/1/press?startup_id="+company.angel_id.to_s).read)
     
        press_page["press"].each do |press|
          puts press["snippet"]
        end
      end
  end
end

