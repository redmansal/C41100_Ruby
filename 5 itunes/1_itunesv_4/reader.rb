#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010


class Reader

	#initialise an obj variable to hold hash table from song_to_lib
	def initialize()
		
	end
	
	 
	
	#read in the songs
	def read_in_songs(csv_file_name)
	  CSV.foreach(csv_file_name, :headers => true) do |row|
		 songname, album, artist, time, id = row[0],row[1],row[2],row[3],row[4]
	 	 unless (songname =~ /#/)
	 	 	 Song.list_add = Song.new(songname,album,artist,time.to_f,id,nil)
	 	 end
	   end
	  Song.list
	end
	   
	#read in the song->library file
	def read_in_libraries(csv_file_name,songs)
	  CSV.foreach(csv_file_name, :headers => true) do |row|
		  song_id, libraries = row[0], row[1]
	 	  unless (song_id =~ /#/)
	 	 	libs_array = libraries.split
	 	 	song_object = (songs.select {|songa| songa.id == song_id}).first
	 	 	song_object.in_libs = Library.convert_to_libs(libs_array)
      #change the in_libs attribute into arrays of library objects
	 	 
	 	  end
	    end
	   
	end
	
end

# reader = Reader.new()
# song_csv_file_name = ARGV[0]
# libraries_csv_file_name = ARGV[1]
# 
# puts "processing Songs from file #{song_csv_file_name}"
# songs = reader.read_in_songs(song_csv_file_name)
# puts songs
# 
# puts "processing Libraries from file #{libraries_csv_file_name}"
# reader.read_in_libraries(libraries_csv_file_name, songs)
# 
# asong = songs.pop
# puts asong
# 
# asong.play_song
# 
# #puts asong.time + 1
# #<need to change this  and id-to/ using  row["Time"].to_i ?>
# 
# puts reader.get_hash_table

