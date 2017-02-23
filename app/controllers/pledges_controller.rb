class PledgesController < ApplicationController
  before_action :require_login

  before_action do
    @reward = Reward.find(params[:reward_id])
  end

  def create

    if @reward.available?
      @pledge = Pledge.new(pledge_params)
      @pledge.user = current_user
      @pledge.reward = Reward.find(params[:reward_id])
      if @pledge.save
        redirect_to project_url(@pledge.project), notice: "You have successfully backed #{@pledge.project.title}!"
      end
    else
      redirect_to project_url, notice: "This reward is unavailable!"
    end

  end

  private

  def pledge_params
    params.require(:pledge).permit(:dollar_amount)
  end
end
