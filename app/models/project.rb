class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :title, :description, :goal, :start_date, :end_date, :user_id, presence: true
  validates :goal , numericality: {greater_than: 0}
  validate :start_date_must_be_in_future
  validate :end_date_must_be_later_than_start_date


  private


  def start_date_must_be_in_future
    today = Date.today
    if start_date != nil && start_date < today
      errors.add(:start_date, "can't be in the past! You silly")
    end
  end

  def end_date_must_be_later_than_start_date
    if end_date != nil && end_date < start_date
      errors.add(:end_date, "can't be before your start date buddy!")
    end
  end

end
