require_relative 'nameable'

class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name, parent_permission)
    @id = Random.rand(1..999_999_999)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    return unless of_age || @parent_permission

    true
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end  

  private

  def of_age?
    @age >= 18
  end
end
