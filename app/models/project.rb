class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :title, :description, :goal, :start_date, :end_date, :user_id, presence: true
  validates :goal, :numericality => { :greater_than_or_equal_to => 0 }
  
  validate :end_date_if_cannot_be_before_start_date
  
  def end_date_if_cannot_be_before_start_date
    if end_date < start_date
      errors.add(:end_date, "Must be later than start date")
    end
  end
end
