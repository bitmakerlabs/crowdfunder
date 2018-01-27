class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :title, :description, :goal, :start_date, :end_date, :user_id, presence: true
  validate :is_start_date_in_future?

  def is_start_date_in_future?
    if start_date.utc.to_f < Time.now.utc.midnight.to_f
      errors.add(:start_date, "Project start date must be in the future")
    end
  end

  def is_end_date_after_start_date?
    if end_date.utc.to_f < start_date.utc.to_f
      errors.add(:end_date, "Project end date must be after start date")
    end
  end
end
