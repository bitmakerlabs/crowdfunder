class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)

    @successful_projects = []
    @projects.each do |project|
      if (project.pledges.map{|p|p.dollar_amount}.sum) >= project.goal
        @successful_projects << project
      end
    end



  end

  def show
    @project = Project.find(params[:id])
    @updates = @project.project_updates.all.reverse
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
      params[:project]["start_date(1i)"].to_i,
      params[:project]["start_date(2i)"].to_i,
      params[:project]["start_date(3i)"].to_i,
      params[:project]["start_date(4i)"].to_i,
      params[:project]["start_date(5i)"].to_i
    )

    # @project.end_date = params[:project][:end_date]
    @project.end_date = DateTime.new(
      params[:project]["end_date(1i)"].to_i,
      params[:project]["end_date(2i)"].to_i,
      params[:project]["end_date(3i)"].to_i,
      params[:project]["end_date(4i)"].to_i,
      params[:project]["end_date(5i)"].to_i
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
