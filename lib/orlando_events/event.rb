class OrlandoEvents::Event
  attr_accessor :name, :events, :month_url

  @@all = []

  def initialize(month_hash)
    month_hash.each do |k,v|
      self.send "#{k}=", v
    end
    @@all << self
  end

  def self.create_from_collection(months_array)
    months_array.each do |month|
      self.new(month)
      # binding.pry
    end
  end

  def self.current
    #return current list of months according to website
    self.scrape_events
  end

  def self.all
    @@all
  end

end
