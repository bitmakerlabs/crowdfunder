class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
     if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to(root_url, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'Logged out!'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end
