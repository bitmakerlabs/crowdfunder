class PledgesController < ApplicationController
  before_action :require_login

  def create
    @project = Project.find(params[:project_id])
    @pledges = Pledge.where(project_id: params[:id])

    @pledge = @project.pledges.build
    @pledge.dollar_amount = params[:pledge][:dollar_amount]
    @pledge.user = current_user
    @total_pledged = 0

    @pledges.each do |pledge|
      @total_pledged += pledge.dollar_amount
    end

    if @pledge.save
      redirect_to project_url(@project), notice: "You have successfully backed #{@project.title}!"
    else
      flash.now[:alert] = @pledge.errors.full_messages.first
      render 'projects/show'
    end
  end
  
end
