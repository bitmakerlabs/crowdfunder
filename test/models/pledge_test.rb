require_relative '../test_helper'

class PledgeTest < ActiveSupport::TestCase

  test "pledge factory" do
    new_pledge = build(:pledge)
    assert new_pledge.valid?
  end

  test 'A pledge can be created' do
    pledge = build(:pledge)
    pledge.save
    assert pledge.valid?
    assert pledge.persisted?
  end

  test 'owner cannot back own project' do
    owner = build(:project_owner)
    owner.save
    project = build(:project)
    project.owner = owner
    project.save
    pledge = build(:pledge, project_id: project.id)
    pledge.user = owner
    pledge.save
    assert pledge.invalid?, 'Owner should not be able to pledge towards own project'
  end

end
