class AddCompletedStatusToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :is_completed, :boolean
  end
end
