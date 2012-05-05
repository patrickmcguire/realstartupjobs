#!/usr/bin/env ruby

require 'rubygems'
require 'typhoeus'
require 'json'
require 'ccsv'
require 'cgi'

filename = ARGV.first

parsed = Array.new

Ccsv.foreach(filename) do |ar|
  fields = Hash.new
  fields[:id] = ar.shift || ''
  fields[:company] = ar.shift || ''
  fields[:company_url] = ar.shift || ''
  fields[:company_hiring] = ar.shift || ''
  fields[:company_jobs_url] = ar.shift || ''
  fields[:added] = ar.shift || ''
  fields[:company_notes] = ar.shift || ''
  parsed << fields
end  

hydra = Typhoeus::Hydra.new(:max_concurrency => 20)
companies = Array.new

parsed.each do |p|
  request = Typhoeus::Request.new('http://api.crunchbase.com/v/1/search.js', :params => {
    :query => CGI::escape(p[:company_url])
  })
  request.on_complete do |response|
    puts p[:company_url]
    json_result = response.body
    parsed_result = JSON.parse(json_result)
    results = parsed_result['results']
    results.each do |r|
      puts r
    end unless !results
  end
  hydra.queue(request)
end

hydra.run
