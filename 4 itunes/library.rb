#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010

class Library
	attr_accessor :name, :songs, :owner
	def initialize(name, songs, owner)
		@name = name
		@songs = songs
		@owner = name + "_owner"
	end
	
	def to_s
		puts "\nLibrary Named << #{@name} >> owned by #{@owner} has following songs:\n"
		@songs.each {|song| song.to_s}
	end	
		
	def isa?
		instance_of?(Library)
	end
	
	def self.make_library(name, songs = [], owner = [])
		Library.new(name, songs, owner)
	end
	
	def self.build_all
		lib_objs = ObjectSpace.each_object(Library).to_a
		songs = ObjectSpace.each_object(Song).to_a

                #p songs
                #p lib_objs
		lib_objs.each do |library|
			songs.each do |song|
				if song.in_libs.include?(library)
					then library.songs << song
				end
			  end
			end
		lib_objs
	end
	
	def self.convert_to_libs(lib_array)
		known_lib_objs = ObjectSpace.each_object(Library).to_a
		out_array = []
		lib_array.each do |lib_name|
			known_obj = (known_lib_objs.select {|kn_lib| kn_lib.name == lib_name}).first
		  if  known_obj 
		  	then out_array << known_obj
		  else out_array <<  make_library(lib_name) 
		  end
		end
		out_array
	end
end

# p Library.convert_to_libs(["apple","lib1","lib2"])
