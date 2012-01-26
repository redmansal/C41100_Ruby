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
    puts "The album #{@name} by #{@artist} has #{@tracks.size}
    song(s) playing for #{@length} minutes. \n"
  end

  def update_album(songs)
    @name = self.name
    
    self.tracks = songs.select {|song| song.album == name}
    self.length = (self.tracks.collect {|song| song.time}).inject {|l,r| l+r}
    self.artist = (self.tracks.collect {|song| song.artist}).uniq
    self
  end

  def self.build_all(songs, out = [])
    album_names = (songs.collect {|song| song.album}).uniq
    
    album_names.each {|album_name| out << Album.new(name, [], [], [])}
    
    puts "break"
    out.each {|album_obj| album_obj.update_album(songs)}
    out
  end
end