class AddDeletedStatusToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :is_deleted, :boolean, :default => false
  end
end
