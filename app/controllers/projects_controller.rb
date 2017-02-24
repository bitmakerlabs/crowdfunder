class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.search(params[:search ])
  end

  def show
    @project = Project.find(params[:id])
    @pledges = @project.pledges

    if current_user
      @update = Update.new
    end

    respond_to do |format|
      format.html
      format.json
    end
    
  end

  def new
    @project = Project.new
    @project.rewards.build
    @photo = Photo.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :image, :category_id, :owner_id, rewards_attributes: [:dollar_amount, :description, :quantity])
  end
end
