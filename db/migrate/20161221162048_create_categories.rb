class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.belongs_to :task, index: true
      t.belongs_to :list, index: true

      t.timestamps
    end
  end
end
