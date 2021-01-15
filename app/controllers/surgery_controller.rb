class SurgeryController < ApplicationController
  def index
    @surgeries = Surgery.all
  end

  def show

  end
end
