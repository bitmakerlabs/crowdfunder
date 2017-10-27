class AddClaimedToRewards < ActiveRecord::Migration[5.1]
  def change
    add_column :rewards, :claimed, :integer, default: 0
  end
end
