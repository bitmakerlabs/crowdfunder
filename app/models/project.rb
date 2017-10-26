class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :user_id, :title, :description, :goal, :start_date, :end_date, presence: true
  validates :goal, numericality: {greater_than: 0}
  validate :project_start_not_in_past
  validate :project_end_date_after_start

  def project_start_not_in_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "Start date can't be in the past")
    end
  end

  def project_end_date_after_start
    if end_date < start_date || end_date == start_date
      errors.add(:end_date, "End date has to be after the start date")
    end
  end
end
