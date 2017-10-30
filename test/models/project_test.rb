require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "project start_date must be in future" do
    owner = new_user
    owner.save
    project = new_project2
    project.user = owner
    project.save
    assert project.invalid?
  end

  test 'valid project can be created' do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.save
    assert project.valid?
    assert project.persisted?
    assert project.user
  end

  test 'project is invalid without owner' do
    project = new_project
    project.user_id = nil
    project.save
    assert project.invalid?
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

  def new_project2
    Project.new(
      title:       'SpaceShip Wow',
      description: 'We wont stop til Mars',
      start_date:  Date.yesterday,
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
