class CreateUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :updates do |t|
      t.belongs_to :project
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
