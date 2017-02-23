class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges
  has_many :backers, through: :pledges, source: :user

  def available?
    quantity_available > 0
  end

  def quantity_available
    quantity - pledges.count
  end

end
