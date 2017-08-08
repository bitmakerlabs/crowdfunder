class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validates :user, presence: true
  validate :owner_cannot_back_own_project


  def owner_cannot_back_own_project
    if user_id == project.owner_id
      self.errors[:user] << 'Owner should not be able to pledge towards own project'
    else
      project.save
    end
  end
end
