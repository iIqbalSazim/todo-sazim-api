class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :priority
      t.datetime :due_date

      t.timestamps
    end
  end
end
