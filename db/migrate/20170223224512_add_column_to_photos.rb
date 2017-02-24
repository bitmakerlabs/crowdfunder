class AddColumnToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :image_uid, :string
  end
end
