class Song
    attr_accessor :name, :artist_name, :song

    @@all = []

    def self.all
        @@all
    end


    # .create - instantiates and saves the song, and it returns the new song that was created
    def self.create
        song = self.new
        @@all << song
        song
    end


    # .new_by_name - instantiates a song with a name property
    def self.new_by_name (name)
        song = self.new
        song.name = name
        song
    end


    # .create_by_name - instantiates and saves a song with a name property
    def self.create_by_name (name)
        song = self.new
        song.name = name
        @@all << song
        song
    end


    # .find_by_name -
        # can find a song present in @@all by name
        # returns falsey when a song name is not present in @@all
    def self.find_by_name (name)
        @@all.find do |x|
            if x.name == name
                x
            else
                false
            end
        end
    end

    # .find_or_create_by_name -
        # invokes .find_by_name and .create_by_name instead of repeating code
        # returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
        # creates a new Song object with the provided title if one doesn't already exist
    def self.find_or_create_by_name (name)
        self.find_by_name(name) || self.create_by_name(name)
    end


    # .alphabetical - returns all the song instances in alphabetical order by song name
    def self.alphabetical
        @@all.sort_by {|songs| songs.name}
    end


    # .new_from_filename - initializes a song and artist_name based on the filename format
    def self.new_from_filename (filename)
        file = filename.split(" - ")
        artist = file[0]
        title, format = file[1].split(".")

        song = self.new
        song.artist_name = artist
        song.name = title
        song
    end


    # .create_from_filename - initializes and saves a song and artist_name based on the filename format
    def self.create_from_filename (filename)
        file = filename.split(" - ")
        artist = file[0]
        title, format = file[1].split(".")

        song = self.create
        song.artist_name = artist
        song.name = title
        song
    end


    # .destroy_all - clears all the song instances from the @@all array
    def self.destroy_all
        @@all.clear
    end


    def save
        self.class.all << self
    end
end
