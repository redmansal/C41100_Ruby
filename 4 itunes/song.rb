#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010

class Song
	attr_accessor :name, :album, :artist, :label, :time, :id, :in_libs
	def initialize(name, album, artist, label, time, id, in_libs)
		@name = name
		@album = album
                @label = label
		@time = time
		@artist = artist
		@id = id
		@in_libs = in_libs
	end
	
	def to_s
		puts "<< #{@name} >> by #{@artist} in their album #{@album}.\n"
	end	
		
	def isa?
		instance_of?(Song)
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
