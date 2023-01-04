require './app'

class Main
  def self.menu
    puts 'Welcome to the Library'
    puts 'Please enter a number to select the option of your choice from the following list'

    @list = {
      '1' => 'List of All Books',
      '2' => 'List of All Peoples',
      '3' => 'Create a Person',
      '4' => 'Create a Book',
      '5' => 'Create a Rental',
      '6' => 'List of All Rentals for a person ID',
      '7' => 'Quit'
    }

    @list.each do |index, string|
      puts "#{index} - #{string}"
    end

    Integer(gets.chomp)
  end

  execute = App.new
  loop do
    case menu
    when 1
      execute.list_of_books
    when 2
      execute.list_of_people
    when 3
      execute.student_or_teacher
    when 4
      execute.create_book
    when 5
      execute.create_rental
    when 6
      execute.list_of_rentals
    when 7
      puts 'Please come again to visit the Library'
      exit
    else
      puts 'Enter the number of your choice between 1 to 7 to enjoy library facility'
    end
  end
end

def main
  Main.new
end

main
