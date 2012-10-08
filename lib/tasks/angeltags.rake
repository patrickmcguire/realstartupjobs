    

def save_angel_tag(name, angel_tag_id, angel_url)
  tag_already = SkillTag.find(:all, :conditions => {:angel_tag_id => angel_tag_id.to_s}) # check to see if the job already exists in the database
  if tag_already.count > 0 
    puts name + " already in db"
  else #if it doesnt, add it
    SkillTag.create ({
      :name => name,
      :angel_tag_url => angel_url,
      :angel_tag_id => angel_tag_id
    })
    puts "Tag: " + name + "ange_tag_id:" + angel_tag_id.to_s + " sucessfully created"
  end
end
def angel_job_tag(job_id, angel_tag_id)
  tag_id = SkillTag.find(:all, :conditions => {:angel_tag_id => angel_tag_id.to_s}).first.id
  puts tag_id

  JobsTag.create ({ 
    :job_id => job_id,
    :tag_id => tag_id
    })
  puts "tag created"
end

desc "test"
task :angeltags => [:environment] do
 jobs = Job.all 
  jobs.each do |job|
    if job.source == "angel"
      job_id = job.id
      angel_id = job.source_unique_id
      puts job.title
      puts job.source_unique_id
      jobs_page = JSON.parse(open("https://api.angel.co/1/jobs/"+angel_id.to_s).read)
      jobs_page["tags"].each do |tag|
        if tag["tag_type"] == "SkillTag"
            angel_tag_id = tag["id"]
            name = tag["display_name"].to_s
            angel_url = tag["angellist_url"].to_s

            save_angel_tag(name, angel_tag_id, angel_url)
            angel_job_tag(job_id, angel_tag_id)
   #     title = job["title"].to_s
    #    description = job["product_desc"].to_s
     #   experience_required = ""
        end
      end

    end
  end

end