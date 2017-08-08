class RewardsController < ApplicationController
  before_action :load_project

  def new
    @reward = Reward.new
  end

  def create
    @reward = @project.rewards.build(reward_params)

    if @reward.save
      redirect_to project_url(@project), notice: 'Reward created'
    else
      render :new
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy

    redirect_to project_url(@project), notice: 'Reward successfully removed'
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def reward_params
    params.require(:reward).permit(:dollar_amount, :description, :project)
  end
end
