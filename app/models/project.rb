class Project < ActiveRecord::Base
  dragonfly_accessor :image

  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'

  accepts_nested_attributes_for :rewards
  validates_presence_of :title, :description, :goal, :start_date, :end_date
  validates :goal, numericality: { greater_than: 0 }
  validates_datetime :start_date, :on_or_after => :today
  validates_datetime :end_date, :after => :start_date

  has_and_belongs_to_many :categories
  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
  has_many :updates

  def self.search(search)
    if search
      where(["title LIKE ?","%#{search}%"])
    else
      all
    end
  end

end
