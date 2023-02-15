# University has name and array of all gradebooks
# add_gradebook add a gradebook that has instructor and course
# instructors method tracks all instructors from every gradebook
# all_grades returns a hash
# all_grades = { instructor : instructor_name
#                course     : course_name
#                grade      : [array of all student averages]
# students_within(lower_bound, higher_bound)

class University
  attr_reader :name, :gradebooks

  def initialize(name)
    @name = name
    @gradebooks = []
  end
end
