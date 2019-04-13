class AddUserAndEmployeeToZDate < ActiveRecord::Migration[5.2]
  def change
    add_reference :zdates, :user, :foreign_key => true
    add_reference :zdates, :employee, :foreign_key => true
  end
end
