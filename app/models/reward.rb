class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges
  has_many :backers, through: :pledges, source: :user

  validates_presence_of :dollar_amount, :description
  validates :dollar_amount, numericality: {greater_than: 0}

end
