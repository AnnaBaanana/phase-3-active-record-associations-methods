class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.count
  end

  def artist_count
   artists = []
   self.songs.each do |song|
    artists << song.artist_id
   end
   artists.uniq.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    artists = []
   self.songs.each do |song|
    artists << song.artist.id
   end
   names = []
   artists.each do |artist_id|
    names << Artist.find(artist_id).name
   end
   names.uniq
  end
end
