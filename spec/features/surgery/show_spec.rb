require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a surgery’s show page (‘/surgeries/:id’)" do
    before :each do
      @mayo_clinic = Hospital.create!(name: 'Mayo Clinic')
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

      visit "/surgeries/#{@surgery_1.id}"
    end

    it 'I see the title and operating room number of that surgery' do
      expect(page).to have_content(@surgery_1.title)
      expect(page).to have_content(@surgery_1.operating_room_number)
    end

    it "I see a section of the page that says 'Other surgeries happening this day of the week:'" do
      within '#other-surgeries-this-day' do
        expect(page).to have_content('Other surgeries happening this day of the week:')
      end
    end

    describe 'And under that header' do
      it 'I see titles of all surgeries that happen on the same day of the week as this surgery.' do
        within '#other-surgeries-this-day' do
          expect(page).to have_content(@surgery_3.title)
          expect(page).to have_content(@surgery_4.title)
        end
      end
    end

    it "I see a field with instructions to 'Add A Doctor To This Surgery'" do
      expect(page).to have_content('Add A Doctor To This Surgery')
      expect(page).to have_content("Doctor Name:")
      expect(page).to have_selector("input[id='operation_doctor_name']")
    end

    describe 'When I input the name of an existing Doctor into that field and I click submit' do
      before :each do
        fill_in 'Doctor Name:', with: @dr_bob.name

        click_on 'Add Doctor To Surgery'
      end

      it "I'm taken back to that surgery's show page" do
        expect(current_path).to eq(surgery_path(@surgery_1.id))
      end

      it 'I see the name of that doctor listed on the page' do
        expect(page).to have_content(@dr_bob.name)
      end
    end
  end
end
