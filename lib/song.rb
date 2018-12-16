require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end



  def self.create
    song = self.new
    #initializes a song
    self.all << song
    #saves song to @@all array
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    #takes in string name of a song & returns a song instance with that name set as its name property
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    #takes in string name & returns song instance with that name set as its name property (same as new_by_name)
    self.all << song
    #saves song into @@all
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
    #accepts string name and returns matching instance of song with that name
    #self.all = @@all array // goes through songs in the array to see if song.name matches the passed in name
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
    #accept a string name and either return a matching song instance or create a new song & return song instance
    #use existing methods instead of repeating code
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
    #sort_by {|x| x} will sort in alphabetical order
  end

  def self.new_from_filename(filename) #"Taylor Swift - Blank Space.mp3"
    song = self.new

    song.name = filename.split(' - ').last.split('.').first
    song.artist_name = filename.split(' - ').first
    #accepts filecase in format of "- .mp3" and returns new song instance with song.name set to name & artist.name set to artist name
    #must be parsed for relevant components & .mp3 should be removed from string
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
    #accepts filename, parses it correctly & saves song instance that was created
  end

  def self.destroy_all
    self.all.clear
    #reset state of @@all class variable to empty array
  end

end
