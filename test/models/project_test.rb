require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

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
    # Arrange
    project = new_project
    project.user = nil
    # Act
    project.save
    # Assert
    assert project.invalid?, 'Project should not save without owner.'
  end

  test 'project is invalid with goal = 0' do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.goal = 0
    project.save
    assert project.invalid?, 'Project should have a goal that is greater than 0.'
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
