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

  test 'project can list backers' do # !!!!!!!!!

    backer = new_user
    backer.save
    project = new_project
    project.owner = backer
    project.save
    pledger = User.new(
      first_name:             'Sam',
      last_name:              'Jones',
      email:                  'sam234567@gmail.com',
      password:               '123412345h',
      password_confirmation:  '123412345h'
      )
    pledger.save
    pledge = Pledge.new(project: project, dollar_amount: 100)
    # pledge does not have user id
    pledge.user = pledger
    byebug

    pledge.save
    assert_equal project.backers, User.where(user_id: backer.user_id)

  end

end
