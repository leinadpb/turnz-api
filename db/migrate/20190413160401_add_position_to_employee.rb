class AddPositionToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :position, :foreign_key => true
  end
end
