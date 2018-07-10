class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :title, :description, :goal, :start_date, :end_date, presence: true

  validates :goal, numericality: { greater_than: 0 }

  validate :need_user

  validate :date_empty

  validate :start_date_in_future

  validate :end_date_greater_than_start_date

  def need_user
    if user == nil
      errors.add(:project, 'needs a user')
    end
  end

  def date_empty
    if start_date == nil || end_date == nil
      errors.add(:project, 'date cannot be empty')
    end
  end

  def start_date_in_future
    if start_date < Date.today
      errors.add(:project, 'start date cannot be in the past')
    end
  end

  def end_date_greater_than_start_date
    if start_date >= end_date
      errors.add(:project, 'end date cannot be earlier than start date')
    end
  end

  def total_pledges
    sum = 0
    self.pledges.each { |pledge| sum+= pledge.dollar_amount }
    return sum
  end

  def backed?(user)
    self.pledges.each do |pledge|
      if pledge.user == user
        return true
      end
    end
    return false
  end

  def backed_total(user)
    total = 0
    self.pledges.each do |pledge|
      if pledge.user == user
        total += pledge.dollar_amount
      end
    end
    return total
  end
end
