require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'valid project can be created' do
    owner = new_user
    owner.save
    project = new_project
    project.owner = owner
    project.save
    assert project.valid?
    assert project.persisted?
    assert project.owner
  end

  test 'project is invalid without owner' do
    project = new_project
    project.owner = nil
    project.save
    assert project.invalid?, 'Project should not save without owner.'
  end

  test 'project invalid when start date in past' do

  owner = new_user
  owner.save
  project = new_project
  project.owner = owner
  project.start_date = Date.yesterday

  assert project.invalid?, 'Project start must be in future.'

  end

  test  'Project end date must be after start date' do
    owner = new_user
    owner.save
    project = new_project
    project.owner = owner
    project.end_date = project.start_date + 1.day
    assert project.valid?, 'Project end date must be after start date.'

    end

    test 'goal_must_be_positive' do

      owner = new_user
      owner.save
      project = new_project
      project.owner = owner
      project.goal = -1

      assert project.invalid?, 'goal must be a positive number'

    end

    test 'project_can_see_pledges'do
    skip
    owner = new_user
    owner.save
    project = new_project
    project.save
    pledge = Pledge.new(dollar_amount: 3.00, project: project)
    pledge.user = owner
    pledge.save



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
