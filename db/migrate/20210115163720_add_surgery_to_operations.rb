class AddSurgeryToOperations < ActiveRecord::Migration[5.2]
  def change
    add_reference :operations, :surgery, foreign_key: true
  end
end
