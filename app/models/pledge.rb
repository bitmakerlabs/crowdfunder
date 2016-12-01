class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :reward
  has_one :project, through: :reward

  validate :enough_pledged
  # validate :project_active

  def enough_pledged
    unless self.dollar_amount >= reward.dollar_amount
      self.errors.add(:dollar_amount, "Amount pledged must be at least $#{reward.dollar_amount}")
    end
  end

  #
  # def project_active
  #   unless Time.now > project.start_date && Time.now < project.end_date
  #     self.errors.add(:dollar_amount, "The project is not yet active")
  #   end
  # end

end
