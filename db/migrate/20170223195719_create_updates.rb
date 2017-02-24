class CreateUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :updates do |t|
      t.date :date
      t.text :body
      t.string :comments
      t.integer :likes

      t.timestamps
    end
  end
end
