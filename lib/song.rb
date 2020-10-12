require 'pry'

class Song
  # Class instance readers and writers
  attr_accessor :name, :artist_name
  # Class variables
  @@all = []

  # Read all songs
  def self.all
    @@all
  end
  
  # Create a blank song and save it 
  def self.create
    new_song = self.new # initialize
    new_song.save # save
    new_song # return
  end

  # initializes a new song instance 
  def self.new_by_name(new_name)
    new_song = self.new # initialize
    new_song.name = new_name # assign
    new_song
  end

  # Creates a new song with a name 
  def self.create_by_name(new_name)
    new_song = self.new_by_name(new_name) # Use class method
    new_song.save # save
    new_song # return
  end

  # return the first song where name matches
  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name #=> instance of song
    end 
  end

  # Looks for a song instance with the same name to return
  # Creates a new song if one with that name doesn't exist
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  # returns an alphabetical list of all songs
  def self.alphabetical
    # Sort by takes the property of the items that you want to compare 
    self.all.uniq.sort_by do |item|
      item.name
    end
  end

  # initializes a new song from a file name
  def self.new_from_filename(file_name)
    file_name = file_name.split(".") # remove .mp3
    file_name = file_name[0] # file_name equal to name without .mp3
 
    file_name = file_name.split("-") # split into array containing artist, name
    file_name.each{ |item| item.strip!} # strips trailing and leading whitespace

    new_song = self.new_by_name(file_name[1]) #initialize new song
    new_song.artist_name = file_name[0] # sets artist name
    new_song # returns new song instance
  end

  # creates and saves a new song from a file name
  def self.create_from_filename(name) 
    new_song = self.new_from_filename(name) # initialize
    new_song.save # save
    new_song # return
  end

  # clear all songs from the class variable
  def self.destroy_all
    self.all.clear # use class reader
  end


  # saves the instance of song
  def save
    self.class.all << self
  end

end
