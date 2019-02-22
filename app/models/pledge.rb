class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validates :user, presence: true

  validate :check_owner

  def check_owner
    errors.add(:user_id, "cannot contribute to their own project") if project.user == self.user

  end
end
