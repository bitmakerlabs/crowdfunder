require_relative '../test_helper'

class PledgeTest < ActiveSupport::TestCase

  # test "pledge factory" do
  #   new_pledge = build(:pledge)
  #   assert new_pledge.valid?
  # end

  test 'dollar amount should be a required field for pledges' do
    project = build(:project)
    project.save
    pledge = build(:pledge, dollar_amount: -100)
    pledge.save
    # byebug

    assert pledge.invalid? 'Pledge must have a dollar amount'
  end

  test 'A pledge can be created' do
    skip
    pledge = Pledge.create(
      dollar_amount: 99.00,
      project: new_project,
      user: new_user
    )
    pledge.save
    assert pledge.valid?
    assert pledge.persisted?
  end

  test 'owner cannot back own project' do
    skip
    owner = new_user
    owner.save
    project = new_project
    project.owner = owner
    project.save
    pledge = Pledge.new(dollar_amount: 3.00, project: project)
    pledge.user = owner
    pledge.save
    assert pledge.invalid?, 'Owner should not be able to pledge towards own project'
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

end
