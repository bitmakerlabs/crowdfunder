require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @project = build(:project)
    @project.save
  end

  def test_valid_project_can_be_created
    assert @project.valid?
    assert @project.persisted?
    assert @project.user
  end

  def test_project_is_invalid_without_owner
    @project.user = nil
    @project.save
    assert @project.invalid?, 'Project should not save without owner.'
  end

  def test_that_project_start_date_is_not_in_the_past
    @project = build(:project, start_date: Date.today - 1.day)
    @project.save
    assert @project.invalid?, 'Project start date should not be in the past.'
  end

  def test_that_project_end_date_is_greater_than_start_date
    @project = build(:project, start_date: Date.today, end_date: Date.today - 1.day)
    @project.save
    assert @project.invalid?, 'Project end date should not be earlier than start date.'
  end

  def test_that_project_start_date_is_not_equal_to_end_date
    @project = build(:project, start_date: Date.today, end_date: Date.today)
    @project.save
    assert @project.invalid?, 'Project end date should not be earlier than start date.'
  end

  def test_that_project_goal_is_greater_than_zero
    @project.goal = -100
    @project.save
    assert @project.invalid?, 'Project goal should not be negative'
  end

  def test_that_project_goal_cannot_be_zero
    @project.goal = 0
    @project.save
    assert @project.invalid?, 'Project goal should not be zero'
  end


end
