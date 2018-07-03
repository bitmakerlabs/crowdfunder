class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :title, :description, :goal, :start_date, :end_date, presence: true

  validate :need_user

  def need_user
    if self.user == nil
      errors.add(:project, 'Project should not save without owner.')
    end
  end
end
