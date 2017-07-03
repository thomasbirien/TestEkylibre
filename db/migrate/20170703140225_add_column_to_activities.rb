class AddColumnToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :old_quantity, :integer
    add_column :activities, :new_quantity, :integer
  end
end
