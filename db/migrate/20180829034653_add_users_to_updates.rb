class AddUsersToUpdates < ActiveRecord::Migration[5.2]
  def change
    add_reference :updates, :user, foreign_key: true
  end
end
