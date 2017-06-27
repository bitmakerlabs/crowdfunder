class Progress < ApplicationRecord
  belongs_to :project
  validates :progress_title, :progress_description, presence: true
  # validates :user, presence: true
  # validate :user_cannot_create_progress
  #
  # def user_cannot_create_progress
  #
  #    if user_id != project.owner_id
  #      errors.add(:user, "Only project owners can create progress reports.")
  #    end
  #  end

end
