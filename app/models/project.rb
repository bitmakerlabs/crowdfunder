class Project < ActiveRecord::Base
  belongs_to :user
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  accepts_nested_attributes_for :rewards
  validates_presence_of :title, :description, :goal, :start_date, :end_date

  def self.search(title, description, goal)
    if title
        @found_projects = Project.where('title ILIKE ? AND description ILIKE ? AND goal < ?', "%#{title}%", "%#{description}%", goal)
    else
        @found_projects = Project.all
    end
  end

end
