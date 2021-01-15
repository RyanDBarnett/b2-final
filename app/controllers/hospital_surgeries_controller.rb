class HospitalSurgeriesController < ApplicationController
  def index
    hospital = Hospital.find(hospital_params[:hospital_id])
    @surgeries = hospital.surgeries
  end

  private

  def hospital_params
    params.permit(:hospital_id)
  end
end
