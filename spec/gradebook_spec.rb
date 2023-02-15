require 'spec_helper'

RSpec.describe Gradebook do
  before(:each) do
    @gradebook1 = Gradebook.new('John Quintanilla')
    @gradebook2 = Gradebook.new('Dallas Williams')
    @calculus = Course.new('Calculus', 2)
    @algebra = Course.new('Algebra', 4)
    @ceramics = Course.new('Ceramics', 4)
    @student1 = Student.new({ name: 'Morgan', age: 21 })
    @student2 = Student.new({ name: 'Jordan', age: 29 })
    @student3 = Student.new({ name: 'Grace', age: 31 })
    @calculus.enroll(@student1)
    @calculus.enroll(@student2)
    @algebra.enroll(@student3)
  end

  describe '#initialize' do
    it 'can initialize a gradebook' do
      expect(@gradebook1).to be_a Gradebook
      expect(@gradebook1.instructor).to eq('John Quintanilla')
      expect(@gradebook1.courses).to eq([])
    end

    it 'can initialize another gradebook' do
      expect(@gradebook2).to be_a Gradebook
      expect(@gradebook2.instructor).to eq('Dallas Williams')
      expect(@gradebook2.courses).to eq([])
    end
  end

  describe '#add_course' do
    it 'can add a course to instructors gradebook' do
      @gradebook1.add_course(@calculus)

      expect(@gradebook1.add_course(@algebra)).to eq([@calculus, @algebra])
      expect(@gradebook1.courses).to eq([@calculus, @algebra])
    end
  end

  describe '#list_all_students' do
    it 'can return a list of courses and respective students' do
      @gradebook1.add_course(@calculus)
      @gradebook1.add_course(@algebra)

      expect(@gradebook1.list_all_students).to eq({ Calculus: [@student1, @student2], Algebra: [@student3] })
    end

    it 'can return an alert if no courses have been added' do
      expect(@gradebook2.list_all_students).to eq('No courses have been added.')
    end
  end

  describe '#students_below' do
    before(:each) do
      @gradebook1.add_course(@calculus)
      @gradebook1.add_course(@algebra)
      @student1.log_score(100)
      @student1.log_score(80)
      @student2.log_score(90)
      @student2.log_score(80)
      @student3.log_score(30)
      @student3.log_score(80)
    end

    it 'can return a list of students whose grades are below a given threshold' do
      expect(@gradebook1.students_below(70)).to eq([@student3])
    end

    it 'can return an alert if all students are above threshold' do
      expect(@gradebook1.students_below(20)).to eq('All student averages are above 20.')
    end

    it 'can return an alert if no courses have been added' do
      expect(@gradebook2.students_below(90)).to eq('No courses have been added.')
    end

    it 'can return an alert if no students are enrolled' do
      @gradebook2.add_course(@ceramics)

      expect(@gradebook2.students_below(90)).to eq('No students are currently enrolled.')
    end
  end
end
