class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :title, :description, :goal, :start_date, :end_date, presence: true

  validates :goal, numericality: { greater_than: 0 }

  validate :need_user

  validate :start_date_in_future

  validate :end_date_greater_than_start_date

  def need_user
    if user == nil
      errors.add(:project, 'needs a user')
    end
  end

  def start_date_in_future
    if start_date == nil || start_date < Date.today
      errors.add(:project, 'start date cannot be in the past')
    end
  end

  def end_date_greater_than_start_date
    if start_date == nil || start_date >= end_date
      errors.add(:project, 'end date cannot be earlier than start date')
    end
  end
end
