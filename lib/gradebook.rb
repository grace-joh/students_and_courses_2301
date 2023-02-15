class Gradebook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    return 'No courses have been added.' if @courses.empty?

    all_students = {}
    @courses.each do |course|
      all_students[course.name.to_sym] = course.students
    end
    all_students
  end

  def students_below(threshold)
    return 'No courses have been added.' if @courses.empty?
    return 'No students are currently enrolled.' if self.list_all_students.values.flatten.empty?

    students_below = []
    list_all_students.each do |_course, students|
      students.each { |student| students_below << student if student.grade < threshold }
    end

    return "All student averages are above #{threshold}." if students_below.empty?

    students_below
  end
end
