require 'spec_helper'

RSpec.describe Gradebook do
  before(:each) do
    @gradebook1 = Gradebook.new('John Quintanilla')
    @gradebook2 = Gradebook.new('Dallas Williams')
    @course1 = Course.new('Calculus', 2)
    @course2 = Course.new('Biochemistry', 4)
    @student1 = Student.new({ name: 'Morgan', age: 21 })
    @student2 = Student.new({ name: 'Jordan', age: 29 })
    @student3 = Student.new({ name: "Grace", age: 31 })
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
end
