class ProjectUpdatesController < ApplicationController
  before_action :require_login, except: [:show]

  def new
    @update = ProjectUpdate.new
    @project = Project.find(params[:project_id])
  end

  def show
    @update = ProjectUpdate.find(params[:project_update_id])
    @project = Project.find(params[:project_id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @update = @project.project_updates.find(params[:id])
  end

  def create
    @update = ProjectUpdate.new
    @project = Project.find(params[:project_id])
    @update.project = @project
    @update.title = params[:project_update][:title]
    @update.description = params[:project_update][:description]

    if @update.save
      redirect_to project_url(@project)
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @update = @project.project_updates.find(params[:id])

    if @update.update_attributes(update_params)
      redirect_to project_path(params[:project_id])
    else
      flash[:notice] = "All fields must be entered."
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @update = @project.project_updates.find(params[:id])
    @update.delete
    redirect_to project_path(params[:project_id])
    flash[:notice] = "Update has been deleted."
  end

  private
  def update_params
    params.require(:project_update).permit(:title, :description)
  end
end
