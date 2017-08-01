class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validates :user, presence: true
  validate :owner?

  def owner?
    if user == project.owner
      errors.add(:user, "must not be owner of project")
    end
  end
end
