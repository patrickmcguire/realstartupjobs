require 'open-uri'
require "nokogiri"
require 'indeed'
Indeed.key = 9573432793094543;

desc " resumator jobs"
task :resumator => [:environment] do
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

  companies = Company.all 
  companies.each do |company|
    companies_checked +=1
    if company.resumator_feed.to_s.length >= 1
      puts  company.name + "- resumator"
      source = "resumator"
      companies_with_resumator += 1
      resumator_jobs_new_company = 0
      resumator_jobs_old_company = 0
      
      resumator_feed = company.resumator_feed.to_s
      doc = Nokogiri::XML(open(resumator_feed))
      resumator_jobs = doc.xpath("//job") 
      resumator_jobs.each do |job|
        source_unique_id = ""
        time = Time.now()
        title = job.xpath("title").inner_text 
        description = job.xpath("description").inner_text 
        kind = job.xpath("type").inner_text 
        experience_required = job.xpath("experience").inner_text
        url = job.xpath("url").inner_text
        city = job.xpath("city").inner_text
        source_unique_id = job.xpath("id").inner_text

        job_in_db = Job.find(:all, :conditions => {:url => url})
        

        if job_in_db.count > 0
          job_id =  job_in_db.first.id
          p = Job.find(job_id)
          p.last_checked = time

          p.source = source
          
          p.sorce_unique_id = source_unique_id
          
          p.save!
          resumator_jobs_old_company += 1
        else
          resumator_jobs_new_company += 1
          Job.create ({
            :company_id => company.id,
            :title => title.to_s,
            :url => url.to_s,
            :last_checked => time, 
            :description => description.to_s,
            :experience_required => experience_required,
            :date_posted => time,
            :source =>  source,
            :sorce_unique_id => source_unique_id

         

          })

        end

      end
      total_resumator_jobs_new += resumator_jobs_new_company
      total_resumator_jobs_checked += resumator_jobs_old_company
      puts "new: " + resumator_jobs_new_company.to_s
      puts "verified: " + resumator_jobs_old_company.to_s 
    elsif company.job_score_feed.to_s.length >= 1
           puts  company.name + "- jobscore"
           source = "jobscore"
          companies_with_jobscore += 1
            jobscore_jobs_new_company = 0
      jobscore_jobs_old_company = 0

      feed_url = company.job_score_feed.to_s
      feed = Feedzirra::Feed.fetch_and_parse(feed_url)
      entries = feed.entries.sort {|a,b| b.published <=> a.published}
      entries.each do |job|
        if job.categories.second.to_s.include? 'NY'
          time = Time.now()
          title = job.title 
          date_posted = job.published
          description = job.content
          kind = job.categories.first 
          url = job.url.to_s
          source_unique_id = job.url.to_s
          job_in_db = Job.find(:all, :conditions => {:url => url})
          
          if job_in_db.count > 0
            
            job_id =  job_in_db.first.id
            p = Job.find(job_id)
            p.source = source
            p.sorce_unique_id = source_unique_id
            p.last_checked = time
            p.save!
            jobscore_jobs_old_company += 1

          else

            jobscore_jobs_new_company += 1

            Job.create ({
              :company_id => company.id,
              :title => title.to_s,
              :url => url,
              :last_checked => time, 
              :description => description.to_s,
              :date_posted => date_posted,
              :source =>  source,
              :sorce_unique_id => source_unique_id

            })
          end
        end
      end
              total_jobscore_jobs_new += jobscore_jobs_new_company
      total_jobscore_jobs_checked += jobscore_jobs_old_company
      puts "new: " + jobscore_jobs_new_company.to_s
      puts "verified: " + jobscore_jobs_old_company.to_s

    
     elsif company.resumator_feed.to_s.length == 0 && company.job_score_feed.to_s.length == 0 && company.name.length >=1
      company_name = company.name.to_s
      if company_name
      else company_name = "fawefaw3rfq2"
      end
      company_joined = "company:" + company_name
      zipcode = "10003"
      radius = "50"
            
      indeed_jobs_old_company = 0

      result = Indeed.search(:q =>  company_joined, :l => zipcode, :sort => "date", :radius => radius, :st => "employer", :limit => "500", :fromage => '30')
      if result.total > 0
                source = "indeed"
        puts  company.name + "- indeed"

        indeedjobs  =  JSON.parse(result.to_json)  #indeed returns number of results
        #puts Indeed.get('7a1f8394a31bffeb').to_s
      #  puts result
        indeedjobs.each do |job|
          title = job["jobtitle"]
          description =  job["snippet"]
          url =  job["url"]
          date_posted = job["date"]
          time = Time.now()
          source_unique_id = job["jobkey"]
          job_in_db = Job.find(:all, :conditions => {:sorce_unique_id => source_unique_id})
            
            if job_in_db.count > 0
              
              job_id =  job_in_db.first.id
              p = Job.find(job_id)
              p.source = source
              p.sorce_unique_id = source_unique_id
              p.last_checked = time
              p.save!
              indeed_jobs_old_company += 1

            else

                  total_indeed_jobs_new += 1
                Job.create ({
                :company_id => company.id,
                :title => title.to_s,
                :url => url,
                :last_checked => time, 
                :description => description.to_s,
                :date_posted => date_posted,
                :source =>  source,
                :sorce_unique_id => source_unique_id

              })
          end
        end
        
      end
    end
  end
  puts "Resumator -  New jobs: "+total_resumator_jobs_new.to_s + " Checked jobs:" + total_resumator_jobs_checked.to_s
  puts "jobscore -  New jobs: "+total_jobscore_jobs_new.to_s + " Checked jobs:" + total_jobscore_jobs_checked.to_s
  puts "indeed jobs: "
end
