class CreateProgressUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
