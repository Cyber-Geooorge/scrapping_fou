require 'nokogiri'
require 'rubygems'
require 'open-uri'

  
def coin_name(page)
  name_array = []
  page.xpath("//tr//td[3]//div").map { |name| name_array << name.text}
  return name_array
end


def coin_value(page)
  value_array = []
  page.xpath("//tr//td//div//a/*").map { |value| value_array << value.text}
  return value_array
end


def produce
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  coin_hash = crypto_name(page).zip(crypto_value(page)).map{ |hash| [hash].to_h}
  puts coin_hash
end

produce
