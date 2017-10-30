class RewardsController < ApplicationController
  before_action :load_project
  before_action :load_new_reward, only: %i(new create)
  before_action :ensure_login
  before_action :ensure_ownership, only: %i(new create)

  def new

  end

  def create
    @reward.dollar_amount = params[:reward][:dollar_amount]
    @reward.description = params[:reward][:description]
    @reward.limit = params[:reward][:limit]
    if @reward.save
      redirect_to project_url(@project), notice: 'Reward created'
    else
      render :new
    end
  end

  def claim
    @reward = Reward.find(params[:id])

    @pledge = @reward.pledges.build
    @pledge.user = current_user
    @pledge.dollar_amount = @reward.dollar_amount
    @pledge.project = @reward.project

    if @reward.limit != nil
      if @reward.claimed < @reward.limit
        add_one_to_claimed_and_save
        if @pledge.save
          flash[:alert] = "1 #{ @reward.description } has been claimed!"
        end
      else
        flash[:alert] = "Sorry, the reward limit has been reached!"
      end
    elsif @pledge.save
      add_one_to_claimed_and_save
      flash[:alert] = "1 #{ @reward.description } has been claimed!"
    else
      flash[:alert] = "You are not eligible to claim this reward!"
    end
    redirect_to project_url(@project)
  end

  def destroy
    @reward = Reward.find(params[:id])
    if ensure_ownership
    else
      @reward.destroy
      redirect_to project_url(@project), notice: 'Reward successfully removed'
    end
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def load_new_reward
    @reward = @project.rewards.build
  end

  def ensure_login
    if !current_user
      flash[:alert] = ["You must be logged in."]
      redirect_to project_url(@project)
    end
  end

  def ensure_ownership
    if current_user != @reward.project.user
      flash[:alert] = "You must be the project's owner."
      redirect_to project_url(@project)
    end
  end

  def add_one_to_claimed_and_save
    @reward.increment(:claimed)
    @reward.save
  end

end
