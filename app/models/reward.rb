class Reward < ActiveRecord::Base
  belongs_to :project
  validates :dollar_amount, :description, presence: true

  validate :reward_dollar_amount_must_be_positive

  def reward_dollar_amount_must_be_positive
    if dollar_amount < 0
      errors.add(:dollar_amount, " must be larger than zero.")
    end
  end

end
