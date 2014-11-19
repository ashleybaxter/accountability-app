class AddNotDoneToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :not_done, :boolean
  end
end
