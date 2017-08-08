class Project < ActiveRecord::Base
  # require 'pry'
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :owner_id, :title, :description, :goal, :start_date, :end_date, presence: true
  validate :start_date_in_future
  validate :end_date_after_start_date
  validate :goal_is_positive

  def start_date_in_future

    if self.start_date >= Date.today

     else
       self.errors[:project] << 'Project start must be in future.'
     end
   end

   def end_date_after_start_date

     if self.start_date < self.end_date

      else
        self.errors[:project] << 'Project end date must be after start date.'
      end
    end

    def goal_is_positive
      if self.goal >= 1
      else
        self.errors[:project] << ' project goal must be a positive number'
      end
    end

 end
