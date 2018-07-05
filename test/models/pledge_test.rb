require_relative '../test_helper'

class PledgeTest < ActiveSupport::TestCase

  def test_a_pledge_can_be_created
    pledge = build(:pledge)
    pledge.save


    assert pledge.valid?
    assert pledge.persisted?
  end

  def test_owner_cannot_back_own_project
    owner = build(:user)
    owner.save
    project = build(:project, user: owner)
    project.save
    pledge = build(:pledge, project: project, user: owner)
    pledge.save
    assert pledge.invalid?, 'Owner should not be able to pledge towards own project'
  end

end
