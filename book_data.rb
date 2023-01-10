require './book'
require 'json'

module BookData
  def list_of_books
    read_book_data
  end    

  def create_book
    print 'Title of the Book is: '
    title = gets.chomp

    print 'Author of the Book is: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    save_book_data(book)

    puts 'Book Information entered successfully'
  end

  def save_book_data(book)
    if File.exist?('./books.json')

      filedata = File.read('./books.json')
      data = JSON.parse(filedata)
      data << book
      book_data_json = data.to_json

      File.open('./books.json', 'w') do |file|
        file.puts book_data_json
      end

    else
      File.open('./books.json', 'w') do |file|
        file.puts @books.to_json
      end
    end
  end

  def read_book_data
    if File.exist?('./books.json')
      books = File.read('./books.json')
      book_data = JSON.parse(books)
      book_data.each do |book|
        puts "Title: #{book['title']}, Author: #{book['author']}"
      end
    else
      puts 'Books are not available'
    end
  end
end
