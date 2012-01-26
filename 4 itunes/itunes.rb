#
# author:        Colm Nolan 
# last modified: 19 October, 2011
# description:   The existing files were modified to reflect what was asked for in the in Practical
#                1. I changed the library.csv file to contain my own music collection
#                2. A added an attribute called label into the song class
#                3. I wrote a new method called find_albums_label which is part of the class album

#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010

#This is the top level

require 'actor'
require 'album'
require 'library'
require 'song'
require 'reader'
require 'utilities'
require 'csv'
require 'error'

reader = Reader.new
song_csv_file_name = ARGV[0]
libraries_csv_file_name = ARGV[1]

puts "\nProcessing Songs from file #{song_csv_file_name}"
songs = reader.read_in_songs(song_csv_file_name)
#p songs[1]
#songs.each {|song| p song}
 
puts "\nProcessing Libraries from file #{libraries_csv_file_name}"
reader.read_in_libraries(libraries_csv_file_name, songs)

#puts reader.get_hash_table

#puts "\n"
#songs.each {|song| p song 
#    puts}
 
puts "\nBuilding Libraries..."
libs = Library.build_all
#libs.each {|lib| lib.to_s}
 
puts "\nBuilding Albums..."
albs = Album.build_all
#albs.each {|alb| alb.to_s}
 
puts "\nBuilding Actors..."
actors = Actor.build_all
#actors.each {|actor| actor.to_s}
#actors.each {|actor| p actor 
#    puts
#    puts}
  
jim = Tuneuts.fetch("melody_library_owner")
new_song = Tuneuts.fetch("Walk on the Wild Side")
puts "\nJim buys \"Walk on the Wild Side\" so now \"melody_library_owner\" has a new song..."
jim.buys_song(new_song)
#Tuneuts.fetch("melody_library").to_s


albs.each {|alb| puts alb.find_albums_label}

#libs.each {|lib| lib.to_s}


# ruby1.9 itunes.rb library.csv song_to_lib.csv
# issue of always passing in objects or names or both
# define a class for bands and integrate it into the whole program
# define a method in actor to buy a whole album
# should really modify the entry in the song_to_lib.csv file

