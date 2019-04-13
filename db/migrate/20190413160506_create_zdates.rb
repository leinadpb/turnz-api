class CreateZdates < ActiveRecord::Migration[5.2]
  def change
    create_table :zdates do |t|

      t.timestamps
    end
  end
end
