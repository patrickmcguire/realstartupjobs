require 'open-uri'
require "nokogiri"
require 'indeed'
Indeed.key = 9573432793094543;
def is_internship(title)
  if title.downcase.include? 'intern'
    return 1
  else
    return 0
  end
end
def is_technical(title)
  if (title.to_s =~ /developer|engineer|scientist|programmer|hacker/i)
    return 1
  else
    return 0
  end
end

 def submit_job(company_id, title, description, experience_required, url, technical, internship,  source, source_unique_id, date_posted, time)
    job_in_db = Job.find(:all, :conditions => {:source_unique_id => source_unique_id})


   if job_in_db.count > 0
      job_id =  job_in_db.first.id
      p = Job.find(job_id)
      p.last_checked = time
      p.internship = internship
      p.source = source
      p.source_unique_id = source_unique_id
      p.technical = technical
      p.save!
    else
      Job.create ({
        :company_id => company_id,
        :title => title,
        :url => url,
        :internship => internship,
        :technical => technical,
        :last_checked => time,
        :description => description,
        :experience_required => experience_required,
        :date_posted => date_posted,
        :source =>  source,
        :source_unique_id => source_unique_id,
        :approved => 0
      })
    end
  end
  
desc "indeed jobs"
task :jobs => [:environment] do
  companies_checked = 0
  companies_with_resumator = 0
  companies_with_jobscore = 0
  total_jobscore_jobs_new = 0
  total_jobscore_jobs_checked = 0
  total_jobscore_jobs = total_jobscore_jobs_new + total_jobscore_jobs_checked
  total_indeed_jobs_new = 0
  total_indeed_jobs_checked = 0
  total_indeed_jobs = total_indeed_jobs_new + total_indeed_jobs_checked
  companies_with_indeed = 0
  total_resumator_jobs_new = 0
  total_resumator_jobs_checked = 0
  total_resumator_jobs = total_resumator_jobs_new + total_resumator_jobs_checked
  time = Time.now

 

  companies = Company.all
  companies.each do |company|
    company_name = company.name.to_s
    companies_checked+=1
    company_id = company.id

    #Resumator
    if company.resumator_feed.to_s.length >= 1
      puts  company.name + "- resumator"
      source = "resumator"
      companies_with_resumator += 1
      resumator_feed = company.resumator_feed.to_s
      doc = Nokogiri::XML(open(resumator_feed))
      resumator_jobs = doc.xpath("//job")
      resumator_jobs.each do |job|
        title = job.xpath("title").inner_text
        description = job.xpath("description").inner_text
        # kind = job.xpath("type").inner_text
        experience_required = job.xpath("experience").inner_text
        url = job.xpath("url").inner_text
        internship = is_internship(title)
        technical = is_technical(title)
        source_unique_id = job.xpath("url").inner_text
        date_posted = time
        if internship == 1
          puts title.to_s + " is an internship"
        end
        if technical == 1
          puts title.to_s + " is technical"
        end
        #city = job.xpath("city").inner_text

        submit_job(company_id, title, description, experience_required, url, technical, internship,  source, source_unique_id, date_posted, time)
      end

   #   total_resumator_jobs_new += resumator_jobs_new_company
    #  total_resumator_jobs_checked += resumator_jobs_old_company
     # puts "new: " + resumator_jobs_new_company.to_s
      #puts "verified: " + resumator_jobs_old_company.to_s
      #jobscore
    elsif company.jobscore_feed.to_s.length >= 1
      puts  company.name + "- jobscore"
      source = "jobscore"
      companies_with_jobscore += 1
     # jobscore_jobs_new_company = 0
    #  jobscore_jobs_old_company = 0
      feed_url = company.jobscore_feed.to_s
      feed = Feedzirra::Feed.fetch_and_parse(feed_url)
      entries = feed.entries.sort {|a,b| b.published <=> a.published}
      entries.each do |job|
        if job.categories.second.to_s.include? 'NY' #checks if the jobs are in the new york area
          title = job.title.to_s
          date_posted = job.published
          description = job.content.to_s
          kind = job.categories.first.to_s
          url = job.url.to_s
          experience_required = ""
          technical = is_technical(title)
          internship = is_internship(title)
          if internship == 1
            puts title + " is an internship"
          end
          if technical == 1
            puts title.to_s + " is technical"
          end
          source_unique_id = job.url.to_s
          submit_job(company_id, title, description, experience_required, url, technical, internship,  source, source_unique_id, date_posted, time)
        end
      end
     # total_jobscore_jobs_new += jobscore_jobs_new_company
    #  total_jobscore_jobs_checked += jobscore_jobs_old_company
  #    puts "new: " + jobscore_jobs_new_company.to_s
   #   puts "verified: " + jobscore_jobs_old_company.to_s

      #if no jobscore or resumator board, fallback to indeed
    elsif  company.resumator_feed.to_s.length == 0 && company.jobscore_feed.to_s.length == 0 && company.name.length >=1
      company_name = company.name.to_s
      if company_name
      else company_name = "fawefaw3rfq2" #this catches random edgecases where company names were giving errors.
      end
      company_joined = "company:" + company_name
      zipcode = "10003"
      radius = "50"
      indeed_jobs_old_company = 0
      indeed_jobs_new_company = 0

      result = Indeed.search(:q =>  company_joined, :l => zipcode, :sort => "date", :radius => radius, :st => "employer", :limit => "500", :fromage => '30')
      if result.total > 0
        source = "indeed"
        puts  company.name + "- indeed"

        indeedjobs  =  JSON.parse(result.to_json)  #indeed returns number of results
        #puts Indeed.get('7a1f8394a31bffeb').to_s
     #   puts indeedjobs.count
        indeedjobs.each do |job|
          title = job["jobtitle"]
          description =  job["snippet"]
          experience_required = ""
          url =  job["url"]
          internship = is_internship(title.to_s)
          technical = is_technical(title.to_s)
          source_unique_id = job["jobkey"]
          date_posted = job["date"]
          submit_job(company_id, title, description, experience_required, url, technical, internship,  source, source_unique_id, date_posted, time)

          if internship == 1
            puts title.to_s + " is an internship"
          end
          if technical == 1
            puts title.to_s + " is technical"
          end
          if internship == true
            puts job.title.to_s + " is an internship"
          end
        end
      end

  #  total_indeed_jobs_new += indeed_jobs_new_company
   # total_indeed_jobs_checked += indeed_jobs_old_company
   # puts "new: " + indeed_jobs_new_company.to_s
   # puts "verified: " +indeed_jobs_old_company.to_s
  end
end
#total_new = total_resumator_jobs_new + total_jobscore_jobs_new + total_indeed_jobs_new
#total_checked = total_resumator_jobs_checked + total_jobscore_jobs_checked + total_indeed_jobs_checked
#total = total_new + total_checked

end

