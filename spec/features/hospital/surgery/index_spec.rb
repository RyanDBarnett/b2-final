require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a hospital’s surgery index (‘/hospitals/:id/surgeries’)" do
    before :each do
      @mayo_clinic = Hospital.create!(name: 'Mayo Clinic')
      @other_hospital = Hospital.create!(name: 'Other Hospital')
      @dr_patel = @mayo_clinic.doctors.create!(name: 'Patel', specialty: 'General', university: 'University of Denver')
      @dr_ryan = @mayo_clinic.doctors.create!(name: 'Ryan', specialty: 'General', university: 'Harvard')
      @dr_bob = @mayo_clinic.doctors.create!(name: 'Bob', specialty: 'General', university: 'Stanford')

      @surgery_1 = Surgery.create!(title: 'Surgery 1', day_of_week: 'Monday', operating_room_number: 1)
      @surgery_2 = Surgery.create!(title: 'Surgery 2', day_of_week: 'Tuesday', operating_room_number: 2)
      @surgery_3 = Surgery.create!(title: 'Surgery 3', day_of_week: 'Monday', operating_room_number: 3)
      @surgery_4 = Surgery.create!(title: 'Surgery 4', day_of_week: 'Monday', operating_room_number: 4)
      @operation_1 = @dr_patel.operations.create!(surgery: @surgery_1)
      @operation_2 = @dr_patel.operations.create!(surgery: @surgery_2)
      @operation_3 = @dr_ryan.operations.create!(surgery: @surgery_1)

      visit "/hospitals/#{@mayo_clinic.id}/surgeries"
    end

    it "I see the titles of all surgeries associated with this hospital" do
      expect(page).to have_content(@surgery_1.title)
      expect(page).to have_content(@surgery_2.title)
      expect(page).to_not have_content(@surgery_3.title)
      expect(page).to_not have_content(@surgery_4.title)
    end
  end
end

# I see the titles of all surgeries associated with this hospital
# And those surgeries are grouped by operating room
