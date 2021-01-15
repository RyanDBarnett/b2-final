class AddDoctorToOperations < ActiveRecord::Migration[5.2]
  def change
    add_reference :operations, :doctor, foreign_key: true
  end
end
