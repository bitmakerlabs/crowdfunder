class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'

  accepts_nested_attributes_for :rewards
  validates_presence_of :title, :description, :goal, :start_date, :end_date
  validates :goal, numericality: { greater_than: 0 }
  validates_datetime :start_date, :on_or_after => :today
  validates_datetime :end_date, :after => :start_date
end
