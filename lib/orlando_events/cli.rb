#CLI Controller
class OrlandoEvents::CLI

  def call
    list_dates
    menu
    goodbye
  end

  def list_dates
    puts "Downtown has so much to offer everyone, who lives, works and plays in Central Florida. Check out what's going on in and around Downtown Orlando!"
    puts "**********************************"
    @dates = OrlandoEvents::Event.current
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
      if input.to_i > 0
        puts @dates[input.to_i-1].events
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
