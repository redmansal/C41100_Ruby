#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010

class Album
	attr_accessor :name, :tracks, :length, :artist, :id
	def initialize(name, tracks, length, artist)
		@name = name
		@tracks = tracks
		@length = length
		@artist = artist
		@id = name.object_id
	end
	
	def to_s
		puts "The album #{@name} by #{@artist}. \n"
	end	
		
	def isa?
		instance_of?(Album)
	end
	
	def self.make_album(name,tracks = [], length=[], artist=[])
		Album.new(name, tracks, length, artist)
	end
	
	def update_album
		name = self.name
		songs = ObjectSpace.each_object(Song).to_a
		self.tracks = songs.select {|song| song.album == name}
		self.length = (self.tracks.collect {|song| song.time}).inject {|l,r| l+r} 
		self.artist = (self.tracks.collect {|song| song.artist}).uniq
		self
	end

        #this method finds that particular album's label and returns it
        def find_albums_label
                albums_label = @name << " has the label " 
                albums_label = albums_label << @tracks[0].label
                albums_label
        end
	
	def self.build_all
		album_objs = []
		songs = ObjectSpace.each_object(Song)
		album_names = (songs.collect {|song| song.album}).uniq
		album_names.each {|album_name| album_objs << make_album(album_name)}
		album_objs.each {|album_obj| album_obj.update_album}
		album_objs
	end
end

# p Album.make_album("test")
