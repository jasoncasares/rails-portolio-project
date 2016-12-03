class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.datetime :due_date
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
