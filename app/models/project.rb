class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  accepts_nested_attributes_for :rewards
  validates_presence_of :title, :description, :goal, :start_date, :end_date

  validates_date :end_date, :after => :start_date
  validates_date :start_date, on_or_after: lambda { Date.current}
  validates :goal, numericality:  {greater_than: 0}



end
