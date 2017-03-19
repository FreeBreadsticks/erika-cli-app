class OrlandoEvents::MonthEvents
  @@all = []

  def self.create_from_collection(months_array)
    months_array.each do |month|
      self.new(month)
      # binding.pry
    end
  end
end
