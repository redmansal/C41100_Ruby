#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010


class Reader
	#initialise an obj variable to hold hash table from song_to_lib
	def initialize()
		@hash_lib = Hash.new
	end
	
	#method that returns value of @hash-table instance variable  
	def get_hash_table
		@hash_lib
	end
	
	#read in the songs
	def read_in_songs(csv_file_name)
	  songs = []
	  CSV.foreach(csv_file_name, :headers => true) do |row|

		 songname, album, artist, label, time, id = row[0],row[1], row[2], row[3], row[4], row[5]
	 	 unless (songname =~ /#/)
	 	 #if (songname !~ /#/)
                         #p row
	 	 	 songs << Song.new(songname,album,artist,label,time.to_f,id,nil)
	 	 end

	   end
	  songs
	end
	   
	#read in the song->library file
	def read_in_libraries(csv_file_name, songs)
	  CSV.foreach(csv_file_name, :headers => true) do |row|
		  song_id, libraries = row[0], row[1]
	 	  unless (song_id =~ /#/)
	 	 	libs_array = libraries.split
                        #p libs_array
	 	 	song_object = (songs.select {|songa| songa.id == song_id}).first

                        #p song_object
                        #10.times do puts end
	 	 	song_object.in_libs = Library.convert_to_libs(libs_array)   
                        #p song_object
                        #10.times do puts end
                        #abort("done now")

	 	 	@hash_lib[song_id] = libs_array
	 	  end
	    end
	    @hash_lib
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

