class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)

    @pledges = Pledge.all

    @finished_backing = 0

    @projects.each_with_index do |project, i|
      total_pledged = 0
      pledges_for_project = Pledge.where(project_id: i)
      pledges_for_project.each do |pledge|
        total_pledged += pledge.dollar_amount
        if total_pledged == project.goal
          @finished_backing += 1
        end
      end
    end
  end

  def show
    @project = Project.find(params[:id])
    @pledges = Pledge.where(project_id: params[:id])
    @pledge_status
    @total_pledged = 0

    @pledges.each do |pledge|
      @total_pledged += pledge.dollar_amount
      if current_user.id == pledge.user_id
        @pledge_status = true
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

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

end
