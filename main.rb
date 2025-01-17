require './Classes/app'

def list_options
  "Welcome to my catalog of things
    1 - List of all books
    2 - List of all music albums
    3 - List of games
    4 - List of all generes
    5 - List of all labels
    6 - List of all authors
    7 - Add a book
    8 - Add a music album
    9 - Add a game
    10 - Exit"
end

def option(option, app)
  case option
  when 1
    app.list_books
  when 2
    app.list_music_albums
  when 3
    app.list_games
  when 4
    app.list_genres
  when 5
    app.list_labels
  when 6
    app.list_authors
  when 7
    app.add_book
  when 8
    app.add_music_album
  when 9
    app.add_game
  when 10
    app.save_data
    exit
  else
    puts 'Invalid option, please type correct number!'
  end
end

def main
  app = App.new
  app.load_data

  loop do
    puts list_options
    puts
    print 'Please select an option:'
    option = gets.chomp.to_i
    option(option, app)
  end
end

main
