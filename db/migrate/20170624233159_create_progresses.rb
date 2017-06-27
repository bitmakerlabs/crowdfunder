class CreateProgresses < ActiveRecord::Migration[5.1]
  def change
    create_table :progresses do |t|
      t.belongs_to :project
      t.string :progress_title
      t.string :progress_description

      t.timestamps
    end
  end
end
