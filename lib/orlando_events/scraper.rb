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
    
  end

  def self.add_event_information
    self.scrape_dates.each do |k, v|
      self.send "#{k}=", v
    end
    self
  end
end
