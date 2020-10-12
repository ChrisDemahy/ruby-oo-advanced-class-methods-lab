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

  # Creates a new song instance 
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
  
  # saves the instance of song
  def save
    self.class.all << self
  end

end
