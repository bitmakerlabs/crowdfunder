class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
  end

  def show
    @project = Project.find(params[:id])
    @pledges = Pledge.where(project_id: params[:id])
    @owner = @project.owner
  end

  def new
    @project = Project.new
    @project.rewards.build
    @project.progresses.build
  end

  def create
    @project = Project.new(project_params)
    @project.image = project_params[:image]
    @project.owner = current_user

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

   def destroy

   end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :image)
  end
end
