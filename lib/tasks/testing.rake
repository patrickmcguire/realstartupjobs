def is_internship(title)
  if (title =~ /intern|internship/i)
    return 1
  else
    return 0
  end
end
def is_technical(title)
  if (title.to_s =~ /technical|developer|engineer|scientist|programmer|javascript|ruby|rails|java|systems|php|database|hacker/i)
    return 1
  else
    return 0
  end
end
def logo_from_url(url)
  io = open(url)
  io.original_filename = "foo.png"
  self.logo = io
end

def  submit_job(company_id, title, description, experience_required, equity_min, equity_max, equity_cliff, salary_min, salary_max, url, source, source_unique_id, date_posted, time)
  
  technical = is_technical(title)
  isinternship = is_internship(title)


  job_in_db = Job.find(:all, :conditions => {:source_unique_id => source_unique_id.to_s}) # check to see if the job already exists in the database
  if job_in_db.count > 0   #if the job exists, update it

    puts "Verified: source: " + source + " " + title + " intern: " + is_internship(title).to_s + " technical: "
    
    job_id =  job_in_db.first.id
    p = Job.find(job_id)
    p.last_checked = time
    p.internship = is_internship(title).to_s
    p.source_unique_id = source_unique_id
    p.technical = is_technical(title).to_s
    if source="angel"
      p.salary_min = salary_min
      p.salary_max = salary_max
      p.equity_min = equity_min
      p.equity_max = equity_max
      p.equity_cliff = equity_cliff
    end
    p.approved = "false"
    p.save!



  else #if it doesnt, add it
    Job.create ({
      :company_id => company_id,
      :title => title,
      :url => url,
      :internship => is_internship(title).to_s,
      :technical => technical,
      :last_checked => time,
      :description => description,
      :experience_required => experience_required,
      :date_posted => date_posted,
      :source =>  source,
      :source_unique_id => source_unique_id,
      :approved => "false",
      :equity_min => equity_min,
      :equity_max => equity_max,
      :equity_cliff => equity_cliff,
      :salary_min => salary_min,
      :salary_max => salary_max
    })
    puts "New: source: " + source + " " + title + " intern: " + is_internship(title).to_s + " technical: " + is_technical(title).to_s

  end
end

desc "test"
task :angeljobs => [:environment] do
  new_jobs_count = 0
  verified_jobs_count = 0
  time = Time.now
  companies = Company.all
  companies.each do |company|
    equity_min = 0
    equity_max = 0
    equity_cliff = 0
    salary_min = 0
    salary_max = 0

    company_name = company.name.to_s
    company_id = company.id
    if company.resumator_feed.to_s.length >= 1

      puts  company.name + "- resumator"
      source = "resumator"
 #     companies_with_resumator += 1
      resumator_feed = company.resumator_feed.to_s
      doc = Nokogiri::XML(open(resumator_feed))
      resumator_jobs = doc.xpath("//job")
      resumator_jobs.each do |job|
        title = job.xpath("title").inner_text
        description = job.xpath("description").inner_text
        # kind = job.xpath("type").inner_text
        experience_required = job.xpath("experience").inner_text
        url = job.xpath("url").inner_text
        source_unique_id = job.xpath("url").inner_text
        date_posted = time
        #city = job.xpath("city").inner_text

        submit_job(company_id, title, description, experience_required, equity_min, equity_max, equity_cliff, salary_min, salary_max, url, source, source_unique_id, date_posted, time)
      end

    elsif company.jobscore_feed.to_s.length >= 1
      puts  company.name + "- jobscore"
      source = "jobscore"
 #     companies_with_jobscore += 1
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

          source_unique_id = job.url.to_s
          submit_job(company_id, title, description, experience_required, equity_min, equity_max, equity_cliff, salary_min, salary_max, url, source, source_unique_id, date_posted, time)
        end
      end

    elsif company.angel_id && JSON.parse(open("https://api.angel.co/1/startups/"+company.angel_id.to_s+"/jobs/").read).count > 0 
         puts company.angel_id

      source ="angel"
      jobs = JSON.parse(open("https://api.angel.co/1/startups/"+company.angel_id.to_s+"/jobs/").read)
      puts source + " " + company_name + jobs.count.to_s
      #    puts jobs.count
      jobs.each do |job|

        title = job["title"].to_s
        description = job["product_desc"].to_s
        experience_required = ""
        url = job["angellist_url"].to_s
        equity_min = job["equity_min"]
        equity_max =  job["equity_max"]
        equity_cliff = job["equity_cliff"]
        salary_min = job["salary_min"]
        salary_max = job["salary_max"]
        source_unique_id = job["id"]
        date_posted = job["updated_at"]
        submit_job(company_id, title, description, experience_required, equity_min, equity_max, equity_cliff, salary_min, salary_max, url, source, source_unique_id, date_posted, time)


      end
    elsif  company.resumator_feed.to_s.length == 0 && company.jobscore_feed.to_s.length == 0 && company.name.length >=1
      company_name = company.name.to_s
      if company_name
      else company_name = "fawefaw3rfq2" #this catches random edgecases where company names were giving errors.
      end
      company_joined = "company:" + company_name #format for company_name queries in indeed
      zipcode = "10003"
      radius = "50"
      indeed_jobs_old_company = 0
      indeed_jobs_new_company = 0
      result = Indeed.search(:q =>  company_joined, :l => zipcode, :sort => "date", :radius => radius, :st => "employer", :limit => "500", :fromage => '30')
      if result.total > 0
        source = "indeed"
        puts  company.name + "- indeed"

        indeedjobs  =  JSON.parse(result.to_json)  #indeed returns number of results
        indeedjobs.each do |job|
          title = job["jobtitle"].to_s
          description =  job["snippet"].to_s
          experience_required = ""
          url =  job["url"]
          source_unique_id = job["jobkey"]
          date_posted = job["date"]
          submit_job(company_id, title, description, experience_required, equity_min, equity_max, equity_cliff, salary_min, salary_max, url, source, source_unique_id, date_posted, time)
        end
      end

      else #worst case fallback to simplyhired

        company_subbed = company.name.gsub(' ','_').gsub(',|.','') #makes the name fit indeeds syntax. They don't offer job filters for new grads with their API, so gotta use RSS feeds
        doc = Nokogiri::XML(open("http://www.simplyhired.com/a/job-feed/rss/l-10003/fcn-"+company_subbed+"/frl-newgrad/fsr-primary/fem-employer"))
        simply_jobs = doc.xpath("/rss/channel/item")
        if simply_jobs.count > 0
          puts  company.name + "- simply_hired"
          source = "simply"
          simply_jobs.each do |job|
            title = job.xpath("title").inner_text
            description = job.xpath("description").inner_text
            experience_required = " "
            date_posted = job.xpath("pubDate").inner_text
            url = job.xpath("link").inner_text
            source_unique_id = url
            #puts title + " " + url + description + date_posted
            submit_job(company_id, title, description, experience_required, equity_min, equity_max, equity_cliff, salary_min, salary_max, url, source, source_unique_id, date_posted, time)
          end
        end
      end
      if company.resumator_feed.to_s.length == 0
      company.jobs.each do |job|

        if job.last_checked < (time - 1.day) 
          puts job.title 
          puts job.last_checked
           jobs = Job.destroy(job.id)
    #       jobs.first.delete!
           puts "success"

        end
      end
    end
    end

  end
