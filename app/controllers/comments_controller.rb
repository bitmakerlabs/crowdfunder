class CommentsController < ApplicationController
	before_action :require_login

	def create
    @project = Project.find(params[:project_id])

    @comment = @project.comments.build
    @comment.text = params[:comment][:text]
    @comment.user_id = current_user.id
	    if @comment.save
	      redirect_to project_url(@project), notice: "Comment added."
	    else
	      flash.now[:alert] = @comment.errors.full_messages.first
	      render 'projects/show'
	    end
  	end
end
