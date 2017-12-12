class CreateUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :updates do |t|
    	t.string :title
    	t.string :description
    	t.datetime :entry_date

    	t.timestamps
    end
  end
end
