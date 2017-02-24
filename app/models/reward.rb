class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges
  has_many :backers, through: :pledges, source: :user

  validates :dollar_amount, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates_presence_of :description

  def available?
    quantity_available > 0
  end

  def quantity_available
    quantity - pledges.count
  end

end
