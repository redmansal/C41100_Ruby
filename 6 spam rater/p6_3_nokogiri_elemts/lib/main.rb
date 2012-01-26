#!/opt/local/bin/ruby1.9 -w
# DOCHAC
# Copyright Mark Keane, All Rights Reserved, 2011

require 'nokogiri'
require 'pp'

file = File.open("ucd_home_page.html")
doc = Nokogiri::HTML(file)

pp doc

puts "break"