class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @allprojects = Project.all
    @projects = Project.all
    @projects = @projects.order(:end_date)
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

    unless @project.pledges.empty?
      @pledges = @project.pledges
    end

    @pledges_by_current_user = []

    @project.pledges.each do |pledge|
      if pledge.user_id == current_user.id
        @pledges_by_current_user << pledge
      end
    end

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
