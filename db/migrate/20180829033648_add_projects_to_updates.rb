class AddProjectsToUpdates < ActiveRecord::Migration[5.2]
  def change
    add_reference :updates, :project, foreign_key: true
  end
end
