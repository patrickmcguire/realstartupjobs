require 'open-uri'
require "nokogiri"
require 'indeed'
Indeed.key = 9573432793094543;
def is_internship(title)
  if (title.to_s =~ /intern|internship/i)
    return 1
  else
    return 0
  end
end

desc "test"
task :testing => [:environment] do
 puts is_internship("Intern")
 puts is_internship("Rails Developer")
  puts is_internship("engineers intern")

end

