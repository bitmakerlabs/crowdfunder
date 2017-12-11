require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

#============= Validation 2.  ===============
  test 'start date must be greater than now' do
    poorject = Project.new(title: "Wowzers", description: "It is really Wow", goal: 5, user_id: 1, start_date: DateTime.new(2001,2,3,4,5,6), end_date: DateTime.new(2020,2,3,4,5,6))

    # poorject.start_date = DateTime.civil_from_format :local, 2012, 12, 17
    # poorject.end_date = DateTime.civil_from_format :local, 2018, 12, 17
    poorject.save

    assert poorject.invalid?
  end

#============= Validation 3.  ================
  test 'End date must be greater than start date' do

    poorject = Project.new(title: "Wowzers", description: "It is really Wow", goal: 5, user_id: 1, start_date: DateTime.new(2030,2,3,4,5,6), end_date: DateTime.new(2020,2,3,4,5,6))
    poorject.save
    assert poorject.invalid?
  end

#============= Validation 4.  ================
  test 'Goal must be greater than 0' do

    poorject = Project.new(title: "Wowzers", description: "It is really Wow", goal: 0, user_id: 1, start_date: DateTime.new(2018,2,3,4,5,6), end_date: DateTime.new(2020,2,3,4,5,6))
    poorject.save
    assert poorject.invalid?
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
    project.user = nil
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

end
