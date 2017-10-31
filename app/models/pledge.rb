class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validates :user, presence: true

  validate :owner_not_pledge_own_project

  private

  def owner_not_pledge_own_project
    if project.user == user
      errors.add( :user_id, "Owner should not be able to pledge his own project")
    end
  end
end
