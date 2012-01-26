#
# itunesv4.rb
#
# author:        Colm Nolan 
# last modified: 24 October, 2011
# description:   I have modified the existing itunes v2 so I can avoid needing to use the hash assocciteve array in the reader class
#                This is possible because when the read_in_libraries method is called it reads in all the necessary information
#                to keep track of the song library relationship
#                The method build_me was written in such a way as to avoid the need for the associative array hash_lib in the reader class
#                The changes made from v2 to v3 in the lecture notes are an improovement because it shows the passing of objects 
#                into related objects and increases readability. The negates the need for methods such as objectspace


#require 'actor','album’,'library’,'song','reader','utilities','csv',
#'error'
require 'reader.rb'

#require 'actor.rb'
require 'album.rb'
require 'library.rb'
require 'song.rb'
#require 'utilities.rb'
require 'csv'
#require 'error.rb'
#require 'predicate.rb'


reader = Reader.new

song_csv_file_name = ARGV[0]
libraries_csv_file_name = ARGV[1]
puts "\nProcessing Songs from file #{song_csv_file_name}"
songs = reader.read_in_songs(song_csv_file_name)



puts "\nProcessing Libraries from file #{libraries_csv_file_name}"
reader.read_in_libraries(libraries_csv_file_name, songs)


#lib_names.each{|key,array| puts "#{key} hello #{array}"}

libs = Library.list

#lib_names.each do |key, array|
#  array.each do|element|
#    puts "#{key} hello #{element}"
#  end
#end

#this will loop through each library assigning their songs
puts "\nBuilding Libraries..."
libs.each do |key|
    key.build_me(songs)
end
 

#psudo code
#foreach of the 3 libraries
# foreach song
#   foreach library name
#     if libraryname in song == one of the 3 libraries
#       libraries.song << song
#     end
#   end
# end
#end
#
#puts "\nBuilding Libraries..."
#libs = Library.build_all(lib_names, songs)

puts "\nBuilding Albums..."
albs = Album.build_all(songs)



#code not implemented

#puts "\nBuilding Actors..."
#actors = Actor.build_all(libs)
#
#jim = Tuneuts.fetch("lib1_owner", actors)
#new_song = Tuneuts.fetch("pony", songs)
#puts jim
#puts new_song
#puts "\nJim buys pony so now lib1 has a new song..."
#jim.buys_song(new_song)

