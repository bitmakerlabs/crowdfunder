class ChangeNameOfUpdate < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :updates, :project_updates
  end

  def self.down
    rename_table :project_updates, :updates
  end
end
