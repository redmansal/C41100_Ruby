#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010
require '../lib/predicate.rb'

class Song
	@@songs = []
    include Pred
	attr_accessor :name, :album, :artist, :time, :id, :in_libs
	def initialize(name, album, artist, time, id, in_libs)
		@name = name
		@album = album
		@time = time
		@artist = artist
		@id = id
		@in_libs = in_libs
	end
	
	def to_s
		puts "<< #{@name} >> by #{@artist} in their album #{@album}.\n"
	end	
	
	def self.list
		@@songs
	end
	
	def self.list_add=(val)
		@@songs << val
	end
	
	def play_song
		no = rand(10)
		no.times {print "#{@name} do be do..."}
		puts "\n"
	end

end

# asong = Song.new("jennife","streets of desire","shaggy",3.25,10,"lib1")
# p asong
# foo = asong.time
# puts foo + 4
# asong.play_song
# puts "is this really a song:"
# puts asong.isa?
