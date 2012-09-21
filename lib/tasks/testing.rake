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
desc "test"
task :testing => [:environment] do
 puts is_technical("Intern")
 puts is_technical("Developer")
  puts is_technical("engineers")

end

