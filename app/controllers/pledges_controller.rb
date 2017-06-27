class PledgesController < ApplicationController
  before_action :require_login

  def create
    @project = Project.find(params[:project_id])

    @pledge = @project.pledges.build(pledge_params)

    if current_user.id != @project.owner_id
      @pledge.user = current_user

      if @pledge.save
        redirect_to project_url(@project), notice: "You have successfully backed #{@project.title}!"
      else
        flash.now[:alert] = @pledge.errors.full_messages.first
        render 'projects/show'
      end
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:dollar_amount)
  end
end
