class OrlandoEvents::Event
  attr_accessor :name, :events, :month_url

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
      OrlandoEvents::MonthEvents.new(event_hash, self)
    end
    self
  end

  def add_events(month_events)
    month_events.month = self if !month_events.month
    @events << month_events
    # binding.pry
  end

  def self.all
    @@all
  end

end
