class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, :user, presence: true
  validate :pledge_userid_cannot_be_project_userid

  def pledge_userid_cannot_be_project_userid
  	project_users = Project.find_by(user_id: (self.user_id))
 	if project_users != nil
  		if self.project_id == project_users.id && self.user_id == project_users.user_id
  			errors.add(:user_id, "can't pledge your own project.")
  		end
	   end
  end





end
