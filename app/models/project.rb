class Project < ActiveRecord::Base
  belongs_to :user
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :rewards
  accepts_nested_attributes_for :rewards
  validates_presence_of :title, :description, :goal, :start_date, :end_date

  def self.search_sans_goal(title, description)
    if true
        @found_projects = Project.where('title ILIKE ? AND description ILIKE ?', "%#{title}%", "%#{description}%")
    else
        @found_projects = Project.all
    end
  end

  def self.search_sans_goal_less(title, description, goal_more)
    if true
        @found_projects = Project.where('title ILIKE ? AND description ILIKE ? AND goal > ?', "%#{title}%", "%#{description}%", "#{goal_more}")
    else
        @found_projects = Project.all
    end
  end

  def self.search_sans_goal_more(title, description, goal_less)
    if true
        @found_projects = Project.where('title ILIKE ? AND description ILIKE ? AND goal < ?', "%#{title}%", "%#{description}%", "#{goal_less}")
    else
        @found_projects = Project.all
    end
  end

  def self.search(title, description, goal_less, goal_more)
    if title
        @found_projects = Project.where('title ILIKE ? AND description ILIKE ? AND goal < ? AND goal > ?', "%#{title}%", "%#{description}%", "#{goal_less}", "#{goal_more}")
    else
        @found_projects = Project.all
    end
  end

end
