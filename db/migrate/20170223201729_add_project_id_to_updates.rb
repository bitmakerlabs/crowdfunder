class AddProjectIdToUpdates < ActiveRecord::Migration[5.0]
  def change
    add_column :updates, :project_id, :integer
  end
end
