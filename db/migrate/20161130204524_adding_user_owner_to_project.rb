class AddingUserOwnerToProject < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer "user_id"
    end
  end
end
