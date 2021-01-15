class Doctor < ApplicationRecord
  validates_presence_of :name, :specialty, :university

  belongs_to :hospital
  has_many :operations
  has_many :surgeries, through: :operations
end
