require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a surgery’s index page (‘/surgeries’)" do
    before :each do
      @mayo_clinic = Hospital.create!(name: 'Mayo Clinic')
      @dr_patel = @mayo_clinic.doctors.create!(name: 'Patel', specialty: 'General', university: 'University of Denver')
      @dr_ryan = @mayo_clinic.doctors.create!(name: 'Ryan', specialty: 'General', university: 'Harvard')
      @surgery_1 = Surgery.create!(title: 'Surgery 1', day_of_week: 'Monday', operating_room_number: 1)
      @surgery_2 = Surgery.create!(title: 'Surgery 2', day_of_week: 'Tuesday', operating_room_number: 2)
      @operation_1 = @dr_patel.operations.create!(surgery: @surgery_1)
      @operation_2 = @dr_patel.operations.create!(surgery: @surgery_2)
      @operation_3 = @dr_ryan.operations.create!(surgery: @surgery_1)

      visit '/surgeries'
    end

    it 'I see the title of all surgeries' do
      expect(page).to have_content(@surgery_1.title)
      expect(page).to have_content(@surgery_2.title)
    end

    it 'For each surgery I see the names of all doctors performing that surgery' do
      within "#surgery-#{@surgery_1.id}" do
        expect(page).to have_content(@dr_patel.name)
        expect(page).to have_content(@dr_ryan.name)
      end

      within "#surgery-#{@surgery_2.id}" do
        expect(page).to have_content(@dr_patel.name)
      end
    end
  end
end
