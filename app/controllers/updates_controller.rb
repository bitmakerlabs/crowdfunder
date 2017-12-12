class UpdatesController < ApplicationController
	before_action :require_login

	def create
    @project = Project.find(params[:project_id])

    @update = @project.updates.build
    @update.description = params[:update][:description]

    if @update.save
      redirect_to project_url(@project), notice: "Update added."
    else
      flash.now[:alert] = @update.errors.full_messages.first
      render 'projects/show'
    end
  end

end
