#!/usr/bin/env ruby
# encoding: UTF-8
def processed_name(string)
  string = string.downcase
  string = string.gsub(/[ .,:;"']/, '')
end

def name_compare(s1, s2)
  p1 = processed_name(s1)
  p2 = processed_name(s2)
  if p1 == p2 
    return true
  elsif p1 + 'com' == p2 || p1 == p2 + 'com'
    return true
  elsif p1 + 'media' == p2 || p1 == p2 + 'media'
    return true
  else
    return false
  end
end

def show_str_comp(s1, s2)
  a1 = s1.split(//)
  a2 = s2.split(//)
  cmp_array = []
  longer = a1.size > a2.size ? a1.size : a2.size
  shorter = a1.size < a2.size ? a1.size : a2.size
  shorter.times {|i| a1[i] == a2[i] ? cmp_array << 1 : cmp_array << 0}
  (shorter..(longer-1)).each {|i| cmp_array << 0}
  puts a1.join(" ")
  puts a2.join(" ")
  puts cmp_array.join(" ") 
end

namespace :crunchbase do
  task :populate => :environment do
    require 'cgi'
    filename = ARGV[1] #first is the rake task!
    puts filename
    parsed = Array.new

    Ccsv.foreach(filename) do |ar|
      fields = Hash.new
      fields[:id] = ar.shift || ''
      fields[:company_hiring] = ar.shift || ''
      fields[:company_jobs_url] = ar.shift || ''
      
      nocrunchbase = ar.shift || ''
      if 'FALSE' == nocrunchbase
        fields[:crunchbase] = false
      else
        fields[:crunchbase] = true
      end

      fields[:company_name] = ar.shift || ''
      fields[:company_overview] = ar.shift || ''
      fields[:company_url] = ar.shift || ''
      fields[:number_of_employees] = ar.shift || ''
      fields[:category] = ar.shift || ''
      fields[:description] = ar.shift || ''
      fields[:founded_year] = ar.shift || ''
      fields[:founded_month] = ar.shift || ''
      fields[:money_raised] = ar.shift || ''
      fields[:crunchbase_url] = ar.shift || ''
      fields[:tag_list] = ar.shift || ''
      fields[:twitter_name] = ar.shift || ''
      fields[:blog_url] = ar.shift || ''
      parsed << fields
    end  

    hydra = Typhoeus::Hydra.new(:max_concurrency => 20)
    companies = Array.new

    parsed.each do |p|
      request = Typhoeus::Request.new('http://api.crunchbase.com/v/1/search.js', :params => {
        :query => CGI::escape(p[:company_name])
      })
      request.on_complete do |response|
        puts "====== #{p[:company_name]} ======="
        json_result = response.body
        begin
          parsed_result = JSON.parse(json_result)
        rescue
          next
        end
        results = parsed_result['results']
        if !results
          puts "fail"
        else
          results.each do |r|
            next unless p[:company_name] && r['name']
            if !name_compare(p[:company_name], r['name'])
              puts "#{p[:company]} != #{r['name']}"
              puts "#{processed_name(p[:company])} != #{processed_name(r['name'])}"
              show_str_comp(processed_name(p[:company_name]), processed_name(r['name']))
              next
            end
            company = Company.find_or_create_by_name(p[:company_name])
            company.overview = r['overview']
            company.save!
          end
        end
      end
      hydra.queue(request)
    end
    hydra.run
  end
end
#:employees, :funding, :name, :url, :jobs, :description
