require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "project factory" do
    new_project = build(:project)
    assert new_project.valid?
  end


  test 'valid project can be created' do
    owner = build(:user)
    owner.save
    project = build(:project)
    project.owner = owner
    project.save
    assert project.valid?
    assert project.persisted?
    assert project.owner
  end

  test 'project is invalid without owner' do
    project = build(:project)
    project.owner = nil
    project.save
    assert project.invalid?, 'Project should not save without owner.'
  end

  test 'project start date must be in the future' do
    owner = build(:user)
    owner.save
    project = build(:project)
    project.owner = owner
    project.start_date = Date.today - 10.days
    project.save
    assert project.invalid?, 'Project start date must be in the future'
  end

  test 'project end date must be later than start date' do
    owner = build(:user)
    owner.save
    project = build(:project)
    project.owner = owner
    project.start_date = Date.today
    project.end_date = Date.today - 1.month
    project.save

    assert project.invalid?, 'Project end date must be later than start date'
  end

  test 'project goal must be a positive number' do
    owner = build(:user)
    owner.save
    project = build(:project)
    project.owner = owner
    project.goal = -10000
    project.save

    assert project.invalid? 'Project goal must be a positive number'
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

  test 'project can list backers' do
    project = build(:project)
    backer = project.owner
    project.save
    pledger = create(:user)
    pledge = build(:pledge)
    pledger = pledge.user
    pledge.project_id = project.id
    pledge.save
    assert project.pledges
  end

end
