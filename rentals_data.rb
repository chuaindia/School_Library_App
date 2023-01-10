require './rental'
require 'json'

module RentalData
  def create_rental
    if !File.exist?('books.json')
      puts 'No Book is available in the Library'
    elsif !File.exist?('people.json')
      puts 'No Members Record is in the Library Database'
    else
      puts 'Select a Book from the list by index'
      books = File.read('books.json')
      books_data = JSON.parse(books)
      books_data.each_with_index do |book, index|
        puts "#{index.to_i} Book Title: #{book.title} Author: #{book.author}"
      end
      
      puts 'Select a Person from the list by index'
      people = File.read('people.json')
      people_data = JSON.parse(people)
      people_data_with_index do |person, index|
        puts "#{index.to_i} Name: #{person.name} Age: #{person.age} ID: #{person.id}"
      end
      rental_person = gets.chomp.to_i - 1

      puts 'Enter the Date :'
      date = gets.chomp
      rental_detail = Rental.new(date, book, person)
      @rentals << rental_detail
      save_rental_detail(rental_detail)
      puts 'Rental created'
    end
  end

  def list_of_rentals
    read_rental_detail
  end

  def save_rental_detail(rental_detail)
    if File.exist?('rentals.json')
      rentals = File.read('rentals.json')
      rental_data = JSON.parse(rentals)
      rental_data << rental_detail
      rental_data_json = rental_data.to_json
      File.open('rentals.json', 'w') do |file|
        file.puts rental_data_json
      end
    else
      File.open('rentals.json', 'w') do |file|
        file.puts @rentals.to_json
      end       
    end
  end

  def read_rental_detail
    if File.exist?('rentals.json')
      rentals = File.read('rentals.json')
      rental_data = JSON.parse(rentals)
      rental_data.each do |rental|
        puts "Date: #{rental['date']}, Book: #{rental['book']['title']} by #{rental['book']['author']}"
      end
    else
      puts 'No record regarding rental is available'
    end
  end
end
           