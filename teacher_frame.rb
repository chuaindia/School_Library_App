require './person_frame'

class Teacher < Person
  def initialize(name, age, parent_permission, specialization)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
