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

def convert_to_pennies(funding)
  if funding =~ /.*M.*/
    funding = funding[1,1]
    funding = funding.to_f
    funding *= 1000000
    return funding
  elsif funding =~ /.*K.*/
    funding = funding[1,1]
    funding = funding.to_f
    funding *= 1000
    return funding
  else
    return funding
  end
end

namespace :crunchbase do
  task :populate => :environment do
    require 'cgi'
    filename = ARGV[1] #first is the rake task!
    puts filename
    parsed = Array.new
    require 'csv'
    TempCompany.all.each do |temp_company|
      fields = Hash.new
      fields[:company_hiring] = temp_company[:company_hiring] == 1 ? true : false
      fields[:company_jobs_url] = temp_company[:company_jobs_url]
      
      nocrunchbase = temp_company[:nocrunchbase]
      if 'FALSE' == nocrunchbase
        fields[:crunchbase] = false
      else
        fields[:crunchbase] = true
      end

      fields[:company_name] = temp_company[:company_name]
      fields[:company_overview] = temp_company[:company_overview]
      fields[:company_url] = temp_company[:company_url]
      fields[:number_of_employees] = temp_company[:number_of_employees]
      fields[:category] = temp_company[:category]
      fields[:description] = temp_company[:description]
      
      founded_year = (temp_company[:founded_year]).to_i
      founded_month = (temp_company[:founded_month]).to_i
      puts founded_year
      puts founded_month
      if (0 != founded_year)
        if (0 != founded_month)
          fields[:founded] = Date.new(founded_year, founded_month)
        else
          fields[:founded] = Date.new(founded_year)
        end
      else
        founded = nil
      end
      fields[:money_raised] = temp_company[:money_raised]
      fields[:crunchbase_url] = temp_company[:crunchbase_url]
      fields[:tag_list] = temp_company[:tag_list]
      fields[:twitter_name] = temp_company[:twitter_name]
      fields[:blog_url] = temp_company[:blog_url]
      parsed << fields
    end  
  
    parsed.each do |fields|
      c = Company.new
      c.crunchbase = fields[:crunchbase]
      c.hiring = fields[:crunchbase_hiring]
      c.description = fields[:description].gsub(/\\n/, "\n")
      c.blog_url = fields[:blog_url]
      c.name = fields[:company_name]
      c.jobs_url = fields[:company_jobs_url]
      c.twitter_name = fields[:twitter_name]
      c.category = fields[:category]
      c.employees = fields[:number_of_employees]
      c.crunchbase_url = fields[:crunchbase_url]
      
      c.funding = convert_to_pennies(fields[:money_raised])
      c.url = fields[:company_url]
      c.overview = fields[:company_overiew]
      c.save!
      
      fields[:tag_list].split(',').each do |tag|
        if tag =~ /^ /
          tag = tag[1,0]
        end
        c.tags += [Tag.find_or_create_by_tag(tag)]
      end
      c.save!
    end
  end
end
#:employees, :funding, :name, :url, :jobs, :description
