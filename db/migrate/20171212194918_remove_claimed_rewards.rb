class RemoveClaimedRewards < ActiveRecord::Migration[5.1]
  def change
  	remove_column(:rewards, :claimed)
  end
end
