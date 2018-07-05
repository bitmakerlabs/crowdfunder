require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def test_valid_project_can_be_created
    project = build(:project)
    project.save
    assert project.valid?
    assert project.persisted?
    assert project.user
  end

  def test_project_is_invalid_without_owner
    project = build(:project)
    project.user = nil
    project.save
    assert project.invalid?, 'Project should not save without owner.'
  end

end
