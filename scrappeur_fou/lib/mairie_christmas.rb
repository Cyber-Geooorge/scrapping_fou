require 'nokogiri'
require 'rubygems'
require 'open-uri'



def get_cityhall_url
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  townhall_array = []
  page.css(".lientxt").map {|name| cityhall_array << name.text.downcase.capitalize!}
  return cityhall_array
end

def get_cityhall_email(cityhall_array)
  cityhall_email_array = []
  cityhall_without_space = []
  cityhall_array.each {|cws| cityhall_without_space << cws.gsub(" ","-").downcase}
  cityhall_without_space.each do |city|
  page = Nokogiri::HTML(URI.open("https://annuaire-des-mairies.com/95/#{city}.html"))
  page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").map { |email| cityhall_email_array << email.text}
  end
  return cityhall_email_array
end


def produce
  cityhall_hash = get_cityhall_url.zip(get_cityhall_email(get_cityhall_url)).map { |hash| [hash].to_h}
  puts cityhall_hash
end

produce
