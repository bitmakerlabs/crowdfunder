class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :is_backer?

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  #find out if current user is a backer of the project or not
  def is_backer?()
    @pledges_by_current_user = []

    if logged_in?
      @pledges.each do |pledge|
        if pledge.user_id == current_user.id
          @pledges_by_current_user << pledge
        end
      end
    end

    if @pledges_by_current_user.empty?
      return false
    else
      return true
    end

  end

end
