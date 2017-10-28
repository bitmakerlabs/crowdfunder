require 'test_helper'
class UpdateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Update can be created" do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.save
    update = new_update
    update.project = project
    update.save
    assert update.persisted?, 'Update should save'
  end

  test "Update must be associated to a valid project" do
    owner = new_user
    owner.save
    update = new_update
    update.save
    assert update.invalid?, 'Update should have a project'
  end

  test "Update must have a valid title" do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.save
    project_update = ProjectUpdate.new(description: "It's all going well!")
    project_update.save
    assert project_update.invalid?, 'Update should have a title'
  end

  test "Update must have a valid description" do
    owner = new_user
    owner.save
    project = new_project
    project.user = owner
    project.save
    project_update = ProjectUpdate.new(title: "Lowenthal")
    project_update.save
    assert project_update.invalid?, 'Update should have a title'
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

  def new_update
    ProjectUpdate.new(
      title: "Lowenthal",
      description: "It's all going well!"
    )
  end
end
