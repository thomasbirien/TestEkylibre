class CreateTanks < ActiveRecord::Migration[5.0]
  def change
    create_table :tanks do |t|
      t.string :tank_name
      t.integer :quantity
      t.integer :quantity_max

      t.timestamps
    end
  end
end
