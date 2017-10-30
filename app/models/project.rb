class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :title, :description, :goal, :start_date, :end_date, :user_id, presence: true

  validate :start_date_must_be_in_future

  private

  def start_date_must_be_in_future
    # take current date
    today = Date.today
    # take start_date
    # start_date
    # compare both and fail if they are not equal
    unless start_date >= today
      errors.add(:start_date, "Date can't be in the past! You silly")
    end
  end
end
