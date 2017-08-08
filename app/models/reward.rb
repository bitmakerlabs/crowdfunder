class Reward < ActiveRecord::Base
  belongs_to :project

  validates :dollar_amount, :description, :project, presence: true
  validate :reward_dollar_amount_must_be_positive

  def reward_dollar_amount_must_be_positive
    if self.dollar_amount < 0.00
      errors.add(:dollar_amount, 'Must be positive.' )
    end
  end

end
