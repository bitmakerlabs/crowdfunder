class CommentsController < ApplicationController
  before_action :load_project

  def new
    if logged_in? 
      @comment = Comment.new
    else
      render "layouts/denied"
    end
  end

  def create
    @comment = Comment.new
    @comment.comment = params[:comment][:comment]
    @comment.project_id = params[:project_id]
    @comment.user_id = current_user.id

    if @comment.save!
      redirect_to project_path(params[:project_id])
    else
      render :new
    end
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

end
