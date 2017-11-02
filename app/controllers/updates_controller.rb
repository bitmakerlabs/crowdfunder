class UpdatesController < ApplicationController
  before_action :load_project

  def new
    if logged_in? && current_user == @project.user
      @update = Update.new
    else
      render 'layouts/denied'
    end
  end

  def create
    @update = Update.new
    @update.note = params[:update][:note]
    @update.project_id = params[:project_id]

    if @update.save!
      flash[:notice] = "Update added to project"
      redirect_to project_path(params[:project_id])
    else
      render :new
    end
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

end
