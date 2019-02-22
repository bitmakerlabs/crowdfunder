class Project < ActiveRecord::Base
  has_many :updates
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :category
  belongs_to :user # project owner

  validates :goal, :numericality => {:greater_than => 0}

  validates :title, :description, :goal, :start_date, :end_date, presence: true

  validates :title, :description, :goal, :start_date, :end_date, :user_id, presence: true

  validate :start_date_in_future

  validate :end_date_later_than_start_date

  def start_date_in_future
    if start_date.present? && start_date.past?
      errors.add(:project, "can't be in the past")
    end
  end

  def end_date_later_than_start_date
    if start_date >= end_date
      errors.add(:project, "end date cant be earlier than start date")
    end
  end

  def total_pledges
    total = 0
    self.pledges.each do |pledge|
      total += pledge.dollar_amount
    end
    return total
  end

  def latest_updates(num)
  #   updates = Update.find_by(project_id: self.id)
  #   return updates.order(created_at: :desc).limit(num)
    return Update.order(created_at: :desc).where(project_id: self.id)
  end

end
