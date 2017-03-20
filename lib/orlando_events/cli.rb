#CLI Controller
class OrlandoEvents::CLI

  def call
    puts "Loading Events..."
    make_months
    puts "."
    add_attributes_to_months
    puts ".."
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
    puts "Welcome to the Orlando Event Tracker!"
    puts "Downtown has so much to offer everyone, who lives, works and plays in Central Florida. Check out what's going on in and around Downtown Orlando!"
    puts "**********************************".colorize(:yellow)
    @dates = OrlandoEvents::Event.all
    @dates.each.with_index(1) do |date, i|
      puts "#{i}. #{date.name}".colorize(:light_cyan)
    end
    puts "**********************************".colorize(:yellow)

  end

  def menu
    input = nil
    while input != "exit"
      puts "Which month's events would you like to see? Enter" + " number".colorize(:green) + " associated with month:"
      puts "Enter " + "list".colorize(:green) + " to see months again or enter " + "exit".colorize(:green) + " to quit program."
      input = gets.strip
      if input.to_i > 0 && input.to_i <= @dates.length
        puts "**** Events for#{@dates[input.to_i-1].name} ****".colorize(:yellow)
        puts ""
        @dates[input.to_i-1].events.each.with_index(1) do |event, i|
          puts "#{i}. Event: #{event.event_title}".colorize(:light_green)
          puts "    Date: #{event.date}".colorize(:light_blue)
          puts "    Location: #{event.event_location}".colorize(:light_red)
          puts "------------------------------------------".colorize(:yellow)
        end
        puts "**** Events for#{@dates[input.to_i-1].name} ****".colorize(:yellow)
        puts ""
      elsif input == "list"
        list_dates
      else
        puts ""
        puts "DOES NOT COMPUTE. Enter " + "number".colorize(:green) + " of month," + " 'list' ".colorize(:green) + "or " + "exit".colorize(:green)
        puts ""
      end
    end
  end

  def goodbye
    puts "**********************************".colorize(:yellow)
    puts "Have a nice day!"
    puts "Be sure to come back soon for more fun events!"
    puts "**********************************".colorize(:yellow)
  end

end
