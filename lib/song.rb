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
    self.all << song = self.new
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.all << song = new_by_name(name)
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if !(song = find_by_name(name))
      song = create_by_name(name)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
    split_file_name = file_name.split(/[-.]/)
    name = split_file_name[1].strip
    artist_name = split_file_name[0].strip
    song = create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    self.all << song = new_from_filename(file_name)
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
