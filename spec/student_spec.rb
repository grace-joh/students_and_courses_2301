require 'spec_helper'

RSpec.describe Student do
  before(:each) do
    @student1 = Student.new({ name: "Morgan", age: 21 })
    @student2 = Student.new({ name: "Grace", age: 31 })
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@student1).to be_a Student
      expect(@student1.name).to eq("Morgan")
      expect(@student1.age).to eq(21)
      expect(@student1.scores).to eq([])
    end

    it 'can initialize another student' do
      expect(@student2).to be_a Student
      expect(@student2.name).to eq("Grace")
      expect(@student2.age).to eq(31)
      expect(@student2.scores).to eq([])
    end
  end

  describe '#log_score' do
    it 'can log a students score' do
      @student1.log_score(89)
      @student1.log_score(78)

      expect(@student1.scores).to eq([89, 78])
    end
  end
end
