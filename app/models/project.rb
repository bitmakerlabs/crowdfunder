class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :owner, :title, :description, :goal, :start_date, :end_date, presence: true

  validate :date_in_future?

  def date_in_future?
    if self.start_date < Date.today
      errors.add(:start_date, "must be in the future")
    end
  end
end
