class RemoveListIdFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :list_id
  end
end
