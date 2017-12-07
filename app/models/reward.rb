class Reward < ActiveRecord::Base
  validates :description, presence: true
  validates :dollar_amount, presence: true

  belongs_to :project
end
