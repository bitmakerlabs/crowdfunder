class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, :user, presence: true
  validate :pledge_userid_cannot_be_project_userid

  def pledge_userid_cannot_be_project_userid
		if project.user == user 
  			errors.add(:user_id, "can't pledge your own project.")
  		end 
	
  end
end
