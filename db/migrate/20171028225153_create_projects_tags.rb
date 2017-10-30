class CreateProjectsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :projects_tags do |t|
      t.integer :tag_id
      t.integer :project_id
    end
  end
end
