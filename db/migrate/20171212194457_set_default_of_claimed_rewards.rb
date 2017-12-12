class SetDefaultOfClaimedRewards < ActiveRecord::Migration[5.1]
  def change
  	change_column(:rewards, :claimed, :integer, :default => 0)
  end
end
