class Reward < ActiveRecord::Base
  belongs_to :project

  validates :dollar_amount, :description, presence: true
  validates :dollar_amount, numericality: { greater_than: 0 }
end
