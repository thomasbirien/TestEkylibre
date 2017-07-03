class AddColumnTankNameToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :tank_name, :string
  end
end
