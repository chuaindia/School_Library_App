require_relative './book'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'

class App
  def initialize
    @list = {
      '1' => 'List of All Books',
      '2' => 'List of All Peoples',
      '3' => 'Create a Person',
      '4' => 'Create a Book',
      '5' => 'Create a Rental',
      '6' => 'List of All Rentals for a person ID',
      '7' => 'Quit'
    }

    @books = []

    @people = []
  end

  def display_list
    @list.each do |key, value|
      puts "#{key} - #{value}"
    end
  end

  def list_of_books
    if @books.empty?
      puts 'No Book is available in the Library - Enter new Books Information'
    else
      @books.map do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_of_people
    if @people.empty?
      puts 'No information regarding Members is available in the Library - Enter Member Informations'
    else
      @people.map do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def student_or_teacher
    print 'Are you a student (s) or teacher (t) ? [Put s/t for you]: '
    input = gets.chomp.downcase

    case input
    when 's'
      create_student
    when 't'
      create_teacher
    else
      puts 'You are not a valid member'
    end
  end

  def create_student
    print 'Name of the student: '
    name = gets.chomp

    print 'Age of the student: '
    age = gets.chomp.to_i

    print 'Do you have Parent permission? [Y/N]:'
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y' then parent_permission = true
    when 'N' then parent_permission = false
    end

    print 'In which Classroom do you belong? '
    classroom = gets.chomp
    student = Student.new(age, classroom, name, parent_permission)

    @people << student
    puts 'Data for Student is entered successfully!!!'
  end

  def create_teacher
    print 'Name of the Teacher: '
    name = gets.chomp

    print 'Age of the Teacher: '
    age = gets.chomp.to_i

    print 'Specialization of the Teacher: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name, true)

    @people << teacher
    puts 'Data for Teacher is entered successfully!!!'
  end

  def create_book
    print 'Title of the Book is: '
    title = gets.chomp

    print 'Author of the Book is: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book Information entered successfully'
  end

  def choose_options(option)
    case option
    when 1 then list_of_books
    when 2 then list_of_people
    when 3 then student_or_teacher
    when 4 then create_book
    end
  end

  def choose_options_and_exit
    option = gets.chomp.to_i

    if option == 7
      puts 'Please come again to visit the Library'
      exit
    else
      choose_options(option)
    end
  end

  def run
    display_list
    choose_options_and_exit
    puts
  end



  # def create_rental
  #   if @books.empty?
  #     puts 'No Book Record is available in the Library'
  #   elsif @people.empty?
  #     puts 'No Members Record is available in the Library'
  #   else
  #     puts 'Select a Book from the list by index'
  #     @books.each_with_index do |book, index|
  #       puts "#{index.to_i + 1} Book Title: #{book.title} Author: #{book.author}"
  #     end
  #     rental_book = gets.chomp.to_i - 1
  #     puts 'Select a Person from the list by index'
  #     @people.each_with_index do |person, index|
  #       puts "#{index.to_i + 1} Name: #{person.name} Age: #{person.age} ID: #{person.id}"
  #     end
  #     rental_person = gets.chomp.to_i - 1
  #     puts 'Enter the Date :'
  #     date = gets.chomp
  #     rental_detail = Rental.new(date, @books[rental_book], @people[rental_person])
  #     @rentals.push(rental_detail)
  #     puts 'Rental created'
  #   end
  # end

  # def list_of_rentals
  #   print 'ID of person: '
  #   id = gets.chomp.to_i

  #   puts 'Rentals: '

  #   rentals = @rentals.select { |rental| rental.person.id == id }

  #   if rentals.empty?
  #     puts 'No rentals found'
  #     return
  #   end

  #   rentals.each do |rental|
  #     print "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}\n"
  #   end
  # end
end
