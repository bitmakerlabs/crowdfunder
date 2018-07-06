require 'test_helper'

class RewardTest < ActiveSupport::TestCase

  def setup
    @reward = build(:reward)
    @reward.save
  end

  def test_a_reward_can_be_created
    assert @reward.valid?
    assert @reward.persisted?
  end

  def test_a_reward_cannot_be_created_without_a_dollar_amount
    @reward.dollar_amount = nil
    @reward.save
    assert @reward.invalid?, 'Reward should be invalid without dollar amount'
  end

  def test_a_reward_cannot_be_created_without_a_description
    @reward.description = nil
    @reward.save
    assert @reward.invalid?, 'Reward should be invalid without a description'
  end

  def test_that_reward_is_positive_number
    @reward.dollar_amount = -100
    assert @reward.invalid?, 'Reward should be invalid without a description'
  end

end
