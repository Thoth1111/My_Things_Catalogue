require 'date'
module InputValidator
  VALID_ALPHA = ('a'...'z').to_a

  def fetch_valid_name(place_holder)
    input = gets.chomp
    lower_input = input.downcase
    until lower_input.chars.all? { |char| VALID_ALPHA.include?(char) }
      puts '!! Please enter only letters !!'
      print place_holder
      input = gets.chomp
      lower_input = input.downcase
    end
    input
  end

  def fetch_valid_number(place_holder)
    begin
      user_age = Integer(gets.chomp)
    rescue StandardError
      puts '!! Please enter an integer number !!'
      print place_holder
      retry
    end
    user_age
  end

  def fetch_valid_date(place_holder)
    begin
      date = gets.chomp
      date.match(/\A\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01])\z/)
      parseable = Date.strptime(date, '%Y-%m-%d')
      throw StandardError if parseable > Date.today
    rescue StandardError
      puts '!! Please enter a valid date in the past !!'
      print place_holder
      retry
    end

    # until parseable < Date.today
    #   puts 'Please enter a date in the past!!'
    #   print place_holder
    #   date = gets.chomp
    #   parseable = Date.strptime(date, '%Y-%m-%d')

    # end
    puts parseable
    parseable
  end

  def fetch_valid_cover_state(place_holder)
    input = gets.chomp
    lower_input = input.downcase
    until %w[good bad ok g b o].include?(lower_input)
      # puts '!! Please enter good, bad, or ok!!'
      print place_holder
      input = gets.chomp
      lower_input = input.downcase
    end
    input
  end
end
