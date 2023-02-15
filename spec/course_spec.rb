require 'spec_helper'

RSpec.describe Course do
  before(:each) do
    @student1 = Student.new({ name: 'Morgan', age: 21 })
    @student2 = Student.new({ name: 'Jordan', age: 29 })
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
end
