#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010

class Actor
	attr_accessor :name, :lib, :id
	def initialize(name, owns_lib)
		@name = name + "_owner"
		@lib = owns_lib
		@id = name.object_id
	end
	
	def to_s
		puts "Actor #{@name} has ID: #{@id}.\n"
	end	
	
	def isa?
		instance_of?(Actor)
	end
	
	def self.build_all
		actors = []
		libs = ObjectSpace.each_object(Library).to_a 
		libs.each {|lib_item| actors << Actor.new(lib_item.name, lib_item)}
		actors
	end
	
	def buys_song(song)
		actors_lib = @lib 
		song.in_libs = song.in_libs << actors_lib
		actors_lib.songs << song
	end
	
end


#stuff from ObjectSpace is an enumerator not array

