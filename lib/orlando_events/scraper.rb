class OrlandoEvents::Scraper

  def self.scrape_events
    events = []
    events << self.scrape_dates
    events
  end

  def self.scrape_dates(date_page)
    months = []
    doc = Nokogiri::HTML(open(date_page))
    doc.css("div#left_nav li").each do |month|
      link = month.css("a").map {|link| link['href']}
      month_info = {:name => month.css("a").text.gsub("               ", ""), :month_url => "http://www.downtownorlando.com/future#{link[0]}"}
      months << month_info
    end
    months
  end

  def self.scrape_event_info(month_page)
    doc = Nokogiri::HTML(open(month_page))
    doc.css(".span4").each do |event|
      date = event.css("strong").text #gets date

    end
    doc.css(".event_detail").each do |event|
      event_title = event.css(".event_title a").text #title
      event_location = event.css(".location").text #date

      binding.pry
    end

  end

  def self.add_event_information
    self.scrape_dates.each do |k, v|
      self.send "#{k}=", v
    end
    self
  end
end
