class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :description
      t.belongs_to :user, index: true
      t.belongs_to :list, index: true

      t.timestamps
    end
  end
end
