class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner
  has_many :project_updates
  has_and_belongs_to_many :tags
  validates :user_id, :title, :description, :goal, :start_date, :end_date, presence: true
  validates :goal, numericality: { greater_than: 0 }
  validate :project_start_not_in_past
  validate :project_end_date_after_start


  def project_start_not_in_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def project_end_date_after_start
    if start_date.present? && end_date.present?
      if end_date < start_date || end_date == start_date
        errors.add(:end_date, 'has to be after the start date')
      end
    end
  end


  def self.search(search)
    where('title ILIKE ?', "%#{search}%")
  end

end
