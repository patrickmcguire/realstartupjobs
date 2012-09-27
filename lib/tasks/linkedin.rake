require 'rubygems'
require 'linkedin'
require 'oauth'
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
def ask message
print message
STDIN.gets.chomp
end

desc "test"
task :linkedin => [:environment] do

#client = LinkedIn::Client.new('jvfc4j7bgn57', 'aHBwiXCb56eKL81A')
#rtoken = client.request_token.token
#rsecret = client.request_token.secret
# puts client.request_token.authorize_url

#print "rtoken " + rtoken.to_s
#puts '  rsecret ' + rsecret.to_s
#print "what's the pin?"
# in = ask('pin')
results = JSON.load(open('http://www.linkedin.com/ta/federator?query=dropbox&types=company').to_json)
results.each do |test|
 test[0]['resultList'].to_a.each do |w|
puts "1"
end
end


#client.authorize_from_access("a7da95a9-2c0e-4af4-acad-74d35a0f0732", "9fe4b7e4-2fe3-483a-bbe4-6647a3eeb1fe")


# puts client.authorize_from_request(rtoken, rsecret, pin).to_s
#puts client.company(options = { :universal-name => 'dropbox' }).to_s

#puts client.search(options = { :keywords => 'groupme' }, type = 'company').to_s

end
#rtoken 456c8119-13b9-40a8-a88b-78562b3d8091  rsecret c05c0641-a39c-4987-8472-aad858f71c81
#what's the pin?pin66948

#["a7da95a9-2c0e-4af4-acad-74d35a0f0732", "9fe4b7e4-2fe3-483a-bbe4-6647a3eeb1fe"]
