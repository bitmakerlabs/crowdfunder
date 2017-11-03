class CreateUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :updates do |t|
      t.text :note, :null => false
      t.integer :project_id, :null => false

      t.timestamps
    end
  end
end
