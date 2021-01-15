require 'rails_helper'

describe Surgery do
  describe 'validations' do
    it { should validate_presence_of :title}
    it { should validate_presence_of :day_of_week}
    it { should validate_presence_of :operating_room_number}
  end

  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'instance methods' do
    describe 'other-surgeries-today' do
      it 'returns the other surgeries happening on the same day as the surgery instance that called the method' do
        surgery_1 = Surgery.create!(title: 'Surgery 1', day_of_week: 'Monday', operating_room_number: 1)
        surgery_2 = Surgery.create!(title: 'Surgery 2', day_of_week: 'Tuesday', operating_room_number: 2)
        surgery_3 = Surgery.create!(title: 'Surgery 3', day_of_week: 'Monday', operating_room_number: 3)
        surgery_4 = Surgery.create!(title: 'Surgery 4', day_of_week: 'Monday', operating_room_number: 4)

        actual = surgery_1.other_surgeries_today

        expected = [surgery_3, surgery_4]

        expect(actual).to eq(expected)
      end
    end
  end
end
