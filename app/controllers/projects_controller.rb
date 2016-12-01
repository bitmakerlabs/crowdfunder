class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)

    if params[:goal_less] == '' && params[:goal_more] == ''
      @found_projects = Project.search_sans_goal(params[:title], params[:description])
    elsif params[:goal_less] == '' || params[:goal_more] == ''
      if params[:goal_less] == ''
        @found_projects = Project.search_sans_goal_less(params[:title], params[:description], params[:goal_more])
      else
        @found_projects = Project.search_sans_goal_more(params[:title], params[:description], params[:goal_less])
      end
    else
      @found_projects = Project.search(params[:title], params[:description], params[:goal_less], params[:goal_more])
    end

  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :image, :user_id, rewards_attributes: [:dollar_amount, :description])
  end
end
