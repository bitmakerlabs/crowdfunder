class PagesController < ApplicationController

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
  end

end
