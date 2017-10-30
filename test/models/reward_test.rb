require 'test_helper'

class RewardTest < ActiveSupport::TestCase

  test 'A reward can be created' do
    project = new_project
    project.save
    reward = Reward.create(
      dollar_amount: 99.00,
      description: 'A heartfelt thanks!',
      project: project
    )
    assert reward.valid?
    assert reward.persisted?
  end

  test 'A reward cannot be created without a dollar amount' do
    project = new_project
    project.save
    reward = Reward.create(
      description: 'A heartfelt thanks!',
      project: project
    )
    assert reward.invalid?, 'Reward should be invalid without dollar amount'
    assert reward.new_record?, 'Reward should not save without dollar amount'
  end

  test 'A reward cannot be created without a description' do
    project = new_project
    project.save
    reward = Reward.create(
      dollar_amount: 99.00,
      project: project
    )
    assert reward.invalid?, 'Reward should be invalid without a description'
    assert reward.new_record?, 'Reward should not save without a description'
  end

  test 'reward is invalid with dollar_amount = 0' do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.save
    reward = new_reward
    reward.project = project
    reward.dollar_amount = 0
    reward.save
    assert reward.invalid?, 'Reward should have a dollar_amount that is greater than 0.'
  end

  test 'reward is invalid with negative dollar_amount' do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.save
    reward = new_reward
    reward.project = project
    reward.dollar_amount = -1
    reward.save
    assert reward.invalid?, 'Reward should have a dollar_amount that is positive.'
  end

  def new_project
    Project.new(
      title:       'Cool new boardgame',
      description: 'Trade sheep',
      start_date:  Date.today,
      end_date:    Date.today + 1.month,
      goal:        50000
    )
  end

  def new_user
    User.new(
      first_name:            'Sally',
      last_name:             'Lowenthal',
      email:                 'sally@example.com',
      password:              'passpass',
      password_confirmation: 'passpass'
    )
  end

  def new_reward
    Reward.new(
      description: "elephant"
    )
  end
end
