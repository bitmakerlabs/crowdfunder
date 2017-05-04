class Project < ActiveRecord::Base
  belongs_to :user
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  accepts_nested_attributes_for :rewards
  validates_presence_of :title, :description, :goal, :start_date, :end_date
  validates :goal, numericality: {greater_than: 0}
  validate :start_date_in_future, :end_date_after_start_date


  mount_uploader :picture, PictureUploader


private

  def start_date_in_future
    unless start_date && start_date > Time.now
      errors.add(:start_date, "must be in the future.")
    end
  end

  def end_date_after_start_date
    unless start_date && end_date && start_date < end_date
      errors.add(:end_date, "must be after start date.")
    end
  end

end
