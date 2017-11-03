class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]


  def index
    @allprojects = Project.all
    @projects = Project.all
    @projects = @projects.order(created_at: :desc)
    if params[:search]
      @projects = Project.search(params[:search]).order(created_at: :desc)
    else
      @projects = Project.all
    end

    @pledges = Pledge.all

    @projects_funded = {}
    @pledges.each do |pledge|
      unless @projects_funded.include?(pledge.project.title)
        @projects_funded[pledge.project.title] = 0
      end
      @projects_funded[pledge.project.title] += pledge.dollar_amount
    end
    @sucessful_projects_amounts = []
    @projects_funded.each do |k, v|
      if v >= Project.find_by(title: k).goal
        @sucessful_projects_amounts << v
      end
    end

  end

  def show
    @project = Project.find(params[:id])
    @projectOwner = @project.user
    @rewards = @project.rewards
    @pledges = @project.pledges.order(created_at: :desc)
    @updates = @project.updates.order(created_at: :desc)
    @comments = @project.comments.order(created_at: :desc)
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
    @project.start_date = params[:project][:start_date]
    @project.end_date = params[:project][:end_date]
    @project.image = params[:project][:image]
    @project.user_id = current_user.id

    if @project.save
      redirect_to projects_url
    else
      render :new
    end

  end


end
