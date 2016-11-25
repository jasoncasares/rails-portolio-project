class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.datetime :due_date
      t.boolean :status, :default => "Task not complete."
      t.string :list_id

      t.timestamps
    end
  end
end
