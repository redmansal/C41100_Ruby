#!/opt/local/bin/ruby1.9 -w
# DOCHAC
# Copyright Mark Keane, All Rights Reserved, 2011

require 'nokogiri'
require 'pp'

file = File.open("html_from_site/hackernews.html")
doc = Nokogiri::HTML(file)

elements = doc.xpath("html/body/center/table/tr/td/table/tr/td/a")

#pp elements

i = 1
array_of_anchor_tags = []

while i < 90
  array_of_anchor_tags << elements[i].to_s 
  i+=3
end


title_of_link = []
array_of_anchor_tags.each do |anchor|
  title_of_link << (anchor.scan(/>.+</)).to_s
end


i = 0
title_of_link.each do |title|
  title_of_link[i] = title.gsub(/>|<|\[|\]|"/,'')
  i+=1
end

puts "Hacker News Scraping\n\n"

title_of_link.each do |title|
  puts "Title: #{title}"
end



