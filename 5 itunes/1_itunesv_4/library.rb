#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010
require '../lib/predicate.rb'

class Library
	@@libraries = []
    include Pred
	attr_accessor :name, :songs, :owner
	def initialize(name, songs, owner)
		@name = name
		@songs = songs
		@owner = name + "_owner"
	end
	
	#def to_s
		#puts "\nLibrary Named << #{@name} >> owned by #{@owner} has following songs:\n"
		#@songs.each {|song| song.to_s}
	#end	

	def self.list
		@@libraries
	end
	
	def self.list_add=(val)
		@@libraries << val
	end
	
	def self.make_library(name, songs = [], owner = [])
		Library.new(name, songs, owner)
	end
  
  #this is a nested loop which loops through each song checking if it its libraries
  #are the same as it's self and if so the song is added to the library
  def build_me(songs)
    songs.each do |song|
      song.in_libs.each do |lib|
        if lib == self
          then self.songs << song
        end
      end
    end
  end

	def self.convert_to_libs(lib_array, out_array = [])
		lib_array.each do |lib_name|
			known_obj = (Library.list.select {|kn_lib| kn_lib.name == lib_name}).first
		  if  known_obj 
		  	then out_array << known_obj
		  else  new_lib = make_library(lib_name)
		  		Library.list_add = new_lib
		  		out_array <<  new_lib
		  end
		end
		out_array
	end
end
# 
# libo = Library.make_library("foo")
# p Library.list
# p Library.list_add = libo
# p Library.list
# p libo

# p Library.convert_to_libs(["apple","lib1","lib2"])
