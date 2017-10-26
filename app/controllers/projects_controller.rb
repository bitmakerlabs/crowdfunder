class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new
    @project.title = params[:project][:title]
    @project.description = params[:project][:description]
    @project.goal = params[:project][:goal]
    # @project.start_date = params[:project][:start_date]
    
    @project.start_date = DateTime.new(
      params[:project]["start_date(1i)"],
      params[:project]["start_date(2i)"],
      params[:project]["start_date(3i)"],
      params[:project]["start_date(4i)"],
      params[:project]["start_date(5i)"]
    )

    # @project.end_date = params[:project][:end_date]
    @project.end_date = DateTime.new(
      params[:project]["end_date(1i)"],
      params[:project]["end_date(2i)"],
      params[:project]["end_date(3i)"],
      params[:project]["end_date(4i)"],
      params[:project]["end_date(5i)"]
    )
    @project.image = params[:project][:image]
    @project.user = current_user

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

end
