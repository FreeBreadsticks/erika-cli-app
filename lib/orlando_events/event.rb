class OrlandoEvents::Event
  attr_accessor :name, :events, :month_url, :date, :event_title, :event_location

  @@all = []

  def initialize(month_hash)
    @events = []
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

  def add_event_details(events_array)
    events_array.each do |event_hash|
      add_event(event_hash)
      event_hash.each do |k, v|
        self.send "#{k}=", v
        # binding.pry
      end
    end
    self
  end

  def add_event(event)

    #return current list of months according to website
    @events << event
    # binding.pry
  end

  def self.all
    @@all
  end

end
