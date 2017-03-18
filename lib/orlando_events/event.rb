class OrlandoEvents::Event
  attr_accessor :name, :events, :url

  def self.current
    #return current list of months according to website
    month_1 = self.new
    month_1.name = "March 2017"
    month_1.events = ["Event","Event","Event","Event",]
    month_1.url = "http://www.downtownorlando.com/future/events/?2017-03"

    month_2 = self.new
    month_2.name = "April 2017"
    month_2.events = ["Event","Event","Event","Event",]
    month_2.url = "http://www.downtownorlando.com/future/events/?2017-04"

    month_3 = self.new
    month_3.name = "May 2017"
    month_3.events = ["Event","Event","Event","Event",]
    month_3.url = "http://www.downtownorlando.com/future/events/?2017-05"

    [month_1, month_2, month_3]
  end

end
