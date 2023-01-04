require_relative './book'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_of_books
    if @books.empty?
      puts 'No Book is available in the Library - Enter new Books Information'
      return
    end
    @books.map do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_of_people
    if @people.empty?
      puts 'No information regarding Members is available in the Library - Enter Member Informations'
      return
    end
    @people.map do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def student_or_teacher
    print 'Are you a student (s) or teacher (t) ? [Put s/t for you] :'
    input = gets.chomp
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
    age = gets.chomp

    print 'Do you have Parent permission? [Yes/No]:'
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Yes'
      parent_permission = true
    when 'No'
      parent_permission = false
    end

    print 'In which Classroom do you belong?'
    classroom = gets.chomp
    student = Student.new(age, classroom, name, parent_permission)
    @people.push(student)
    puts 'Data for Student is entered successfully'
  end

  def create_teacher
    print 'Name of the Teacher: '
    name = gets.chomp

    print 'Age of the Teacher: '
    age = gets.chomp

    print 'Specialization of the Teacher:'
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name, true)
    @people.push(teacher)
    puts 'Data for Teacher is entered successfully'
  end

  def create_book
    print 'Title of the Book is :'
    title = gets.chomp

    print 'Author of the Book is :'
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts 'Book Information entered successfully'
  end

  def create_rental
    if @books.empty?
      puts 'No Book Record is available in the Library'
    elsif @people.empty?
      puts 'No Members Record is available in the Library'
    else
      puts 'Select a Book from the list by index'
      @books.each_with_index do |book, index|
        puts "#{index.to_i + 1} Book Title: #{book.title} Author: #{book.author}"
      end
      rental_book = gets.chomp.to_i - 1
      puts 'Select a Person from the list by index'
      @people.each_with_index do |person, index|
        puts "#{index.to_i + 1} Name: #{person.name} Age: #{person.age} ID: #{person.id}"
      end
      rental_person = gets.chomp.to_i - 1
      puts 'Enter the Date :'
      date = gets.chomp
      rental_detail = Rental.new(date, @books[rental_book], @people[rental_person])
      @rentals.push(rental_detail)
      puts 'Rental created'
    end
  end

  def list_of_rentals
    puts 'What is the id of the person ?'
    @people.each { |i| puts "id: #{i.id}, Person: #{i.name}" }
    print 'ID of the person is: '
    @rentals.each do |i|
      puts "Date: #{i.date}, Book: '#{i.book.title}' by #{i.book.author}" if i.person.id.to_i == person.id.to_i
    end
  end
end
