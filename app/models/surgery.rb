class Surgery < ApplicationRecord
  validates_presence_of :title, :day_of_week, :operating_room_number

  has_many :operations
  has_many :doctors, through: :operations
end
