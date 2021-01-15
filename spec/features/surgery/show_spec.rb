require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a surgery’s show page (‘/surgeries/:id’)" do
    before :each do
      @mayo_clinic = Hospital.create!(name: 'Mayo Clinic')
      @dr_patel = @mayo_clinic.doctors.create!(name: 'Patel', specialty: 'General', university: 'University of Denver')
      @dr_ryan = @mayo_clinic.doctors.create!(name: 'Ryan', specialty: 'General', university: 'Harvard')
      @surgery_1 = Surgery.create!(title: 'Surgery 1', day_of_week: 'Monday', operating_room_number: 1)
      @surgery_2 = Surgery.create!(title: 'Surgery 2', day_of_week: 'Tuesday', operating_room_number: 2)
      @operation_1 = @dr_patel.operations.create!(surgery: @surgery_1)
      @operation_2 = @dr_patel.operations.create!(surgery: @surgery_2)
      @operation_3 = @dr_ryan.operations.create!(surgery: @surgery_1)

      visit "/surgeries/#{@surgery_1.id}"
    end

  end
end

# And on the show page I see the title and operating room number of that surgery
# And I see a section of the page that says "Other surgeries happening this day of the week:"
# And under that header I see titles of all surgeries that happen on the same day of the week as this surgery.
# (Note: You do not need to use the created_at or updated_at columns for Surgeries)
