class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :owner, :title, :description, :goal, :start_date, :end_date, presence: true

  validate :date_in_future?
  validate :end_date_after_start_date
  validates :goal, numericality: { greater_than_or_equal_to: 0}

  def date_in_future?
    if self.start_date < Date.today
      errors.add(:start_date, "must be in the future")
    end
  end

  def end_date_after_start_date
    if self.end_date < self.start_date
      errors.add(:end_date, "must be later than start date")
    end
  end
end
