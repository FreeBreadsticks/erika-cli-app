#CLI Controller
class OrlandoEvents::CLI

  def call
    make_months
    add_attributes_to_months
    list_dates
    menu
    goodbye
  end

  def make_months
    months_array = OrlandoEvents::Scraper.scrape_dates("http://www.downtownorlando.com/future/events/")
    OrlandoEvents::Event.create_from_collection(months_array)
  end

  def add_attributes_to_months
    OrlandoEvents::Event.all.each do |month|
      events = OrlandoEvents::Scraper.scrape_event_info(month.month_url)
      month.add_event_details(events)
    end
  end

  def list_dates
    puts "Downtown has so much to offer everyone, who lives, works and plays in Central Florida. Check out what's going on in and around Downtown Orlando!"
    puts "**********************************"
    @dates = OrlandoEvents::Event.all
    @dates.each.with_index(1) do |date, i|
      puts "#{i}. #{date.name}"
    end
    puts "**********************************"

  end

  def menu
    input = nil
    while input != "exit"
      puts "Which month's events would you like to see? Enter number associated with month:"
      puts "Enter 'list' to see months again or enter 'exit' to quit program"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= @dates.length
        puts "Events for #{@dates[input.to_i-1].name}:"
        @dates[input.to_i-1].events.each do |event_hash|
          event_hash.each do |k, v|
            puts "#{k}: #{v}"
          end
          puts "---------------------------"
        end
        #   puts "#{event.event_title}"
        # puts @dates[input.to_i-1].events
      elsif input == "list"
        list_dates
      else
        puts ""
        puts "DOES NOT COMPUTE. Enter number of month, list or exit."
        puts ""
      end
    end
  end

  def goodbye
    puts ""
    puts "Have a nice day!"
    puts "Be sure to come back soon for more fun events!"
  end

end
