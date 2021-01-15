class Surgery < ApplicationRecord
  validates_presence_of :title, :day_of_week, :operating_room_number

  has_many :operations
  has_many :doctors, through: :operations

  def other_surgeries_today
    Surgery.where(day_of_week: self.day_of_week).where.not(id: self.id)
  end
end
