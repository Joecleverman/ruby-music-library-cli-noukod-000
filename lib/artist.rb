class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(artist)
    Artist.new(artist).save
  end

  def add_song(song)
    @songs << song unless @songs.include? song
    song.artist = self unless song.artist
  end

  def genres
    @songs.map(&:genre).uniq
  end

  def to_s
    name
  end
end
