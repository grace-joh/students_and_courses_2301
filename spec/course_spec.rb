require 'spec_helper'

RSpec.describe Course do
  before(:each) do
    @student1 = Student.new({ name: 'Morgan', age: 21 })
    @student2 = Student.new({ name: 'Jordan', age: 29 })
    @student3 = Student.new({ name: "Grace", age: 31 })
    @course1 = Course.new('Calculus', 2)
    @course2 = Course.new('Biochemistry', 4)
  end

  describe '#initialize' do
    it 'can initialize a course' do
      expect(@course1).to be_a Course
      expect(@course1.name).to eq('Calculus')
      expect(@course1.capacity).to eq(2)
      expect(@course1.students).to eq([])
    end

    it 'can initialize another course' do
      expect(@course2).to be_a Course
      expect(@course2.name).to eq('Biochemistry')
      expect(@course2.capacity).to eq(4)
      expect(@course2.students).to eq([])
    end
  end

  describe '#full?' do
    it 'can determine if course is not at capacity' do
      expect(@course1.full?).to eq(false)
    end

    it 'can determine if course is at capacity' do
      @course1.enroll(@student1)
      @course1.enroll(@student2)

      expect(@course1.full?).to eq(true)
    end
  end

  describe '#enroll' do
    it 'can add students to a course' do
      @course1.enroll(@student1)
      @course1.enroll(@student2)

      expect(@course1.students).to eq([@student1, @student2])
    end

    it 'can alert that a course is full and will not add students' do
      @course1.enroll(@student1)
      @course1.enroll(@student2)

      expect(@course1.enroll(@student3)).to eq('The course is full.')
    end
  end
end
