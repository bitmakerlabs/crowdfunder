require_relative '../test_helper'

class PledgeTest < ActiveSupport::TestCase


  def test_a_pledge_can_be_created
    pledge = build(:pledge)
    pledge.save
    assert pledge.valid?
    assert pledge.persisted?
  end

  def test_owner_cannot_back_their_own_project
    owner = build(:user)
    owner.save
    project = build(:project, user: owner)
    project.save
    pledge = build(:pledge, project: project, user: owner)
    pledge.save
    assert pledge.invalid?, 'Owner should not be able to pledge towards own project'
  end

  def test_pledge_has_a_dollar_ammount
    pledge = build(:pledge, dollar_amount: nil)
    pledge.save
    assert pledge.invalid?, 'A pledge dollar amount cannot be nil'
  end

  def test_pledge_doesnt_have_an_empty_dollar_ammount
    pledge = build(:pledge, dollar_amount: "")
    pledge.save
    assert pledge.invalid?, 'A pledge dollar amount cannot be empty'
  end

  def test_pledge_doesnt_have_a_string_dollar_ammount
    pledge = build(:pledge, dollar_amount: "fifty")
    pledge.save
    assert pledge.invalid?, 'A pledge dollar amount cannot be a string'
  end

  def test_pledge_has_a_positive_dollar_ammount
    pledge = build(:pledge, dollar_amount: -50)
    assert pledge.invalid?, 'A pledge cannot be a negative dollar amount'
  end

  def test_pledge_doesnt_have_a_zero_dollar_ammount
    pledge = build(:pledge, dollar_amount: 0)
    assert pledge.invalid?, 'A pledge cannot be a negative dollar amount'
  end

end
