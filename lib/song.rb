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
    self.all << song = self.new  
    song.name = name 
    song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      return song if song.name == name 
    end
    nil
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical 
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    attribute = file.split(" - ")
    song = attribute.reduce(nil) do 
      name = attribute[1].split(".mp3").pop
      artist_name = attribute[0]

      new_song = self.new 
      new_song.name = name 
      new_song.artist_name = artist_name 
      new_song
    end
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save 
  end

  def self.destroy_all
    self.all.clear 
  end

end
