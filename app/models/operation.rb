class Operation < ApplicationRecord
  belongs_to :doctor
  belongs_to :surgery
end
