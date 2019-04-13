class CreateCompany < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
