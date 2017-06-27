class Project < ActiveRecord::Base

  mount_uploader :image, ProjectImageUploader

  has_many :rewards
  has_many :progresses
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :title, :description, :goal, :start_date, :end_date, presence: true
  validate :start_date_must_be_in_future
  validate :end_date_later_than_start_date
  validate :goal_must_be_positive

  def time_left
    sec = (end_date - Time.current)
    days = (sec / 86400)
    return days.round(2)
  end

  def start_date_must_be_in_future
    if start_date < Time.current
      errors.add(:start_date, " must be in the future.")
    end
  end

  def end_date_later_than_start_date
    if end_date < start_date
      errors.add(:end_date, " must be later than start date.")
    end
  end

  def goal_must_be_positive
    if goal < 0
      errors.add(:goal, " must be larger than zero.")
    end
  end

  def total_pledges
    total_pledges = []
    pledges.each do |pledge|
      total_pledges << pledge.dollar_amount
    end
    return total_pledges.sum
  end

  def progress_bar
    (total_pledges / goal).round(2) * 100
  end

end
