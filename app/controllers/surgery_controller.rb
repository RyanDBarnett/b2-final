class SurgeryController < ApplicationController
  def index
    @surgeries = Surgery.all
  end
end
