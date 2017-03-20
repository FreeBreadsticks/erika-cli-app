class OrlandoEvents::MonthEvents
  attr_accessor :date, :event_title, :event_location, :month
  @@all = []

  def initialize(months_hash, month)
    months_hash.each do |k, v|
      self.send "#{k}=", v
    end
    self.month = month
    @@all << self
  end

  def month=(month)
    @month = month
    month.add_events(self)
  end
  
  def self.all
    @@all
  end

end
