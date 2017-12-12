class AddLimitsToRewards < ActiveRecord::Migration[5.1]
  def change
  	add_column(:rewards, :amount, :integer, :default => 1)
  	add_column(:rewards, :claimed, :integer)
  end
end
