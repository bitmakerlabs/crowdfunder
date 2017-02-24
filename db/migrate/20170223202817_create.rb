class Create < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_projects do |t|
      t.integer :category_id
      t.integer :project_id

      t.timestamps
    end
  end
end
