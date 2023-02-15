require 'spec_helper'

RSpec.describe University do
  describe '#initialize' do
    it 'can initialize' do
      univ_denver = University.new('University of Denver')

      expect(univ_denver).to be_a University
      expect(univ_denver.name).to eq('University of Denver')
      expect(univ_denver.gradebooks).to eq([])
    end
  end
end