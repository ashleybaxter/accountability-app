class AddDoneBooleanToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :done, :boolean
  end
end
