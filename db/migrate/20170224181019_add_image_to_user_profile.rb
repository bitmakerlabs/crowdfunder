class AddImageToUserProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image_uid, :string
    add_column :users, :image_name, :string
  end
end
