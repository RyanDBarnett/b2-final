class OperationsController < ApplicationController
  def create
    Operation.create!(operation_params)
    redirect_to surgery_path(operation_params[:surgery][:id])
  end

  private

  def operation_params
    {
      doctor: Doctor.find_by(name: doctor_params[:doctor_name]),
      surgery: Surgery.find(surgery_params[:surgery_id])
    }
  end

  def doctor_params
    params.require(:operation).permit(:doctor_name)
  end

  def surgery_params
    params.permit(:surgery_id)
  end
end
