class ProgressesController < ApplicationController

    before_action :load_project

    def new
      @progress = Progress.new
    end

    def create
      @progress = @project.progresses.build(progress_params)

      if @progress.save
        redirect_to project_url(@project), notice: 'Progress report created'
      else
        render :new
      end
    end

    def edit
      @progress = Progress.find(params[:id])
    end

    def update
      @progress = Progress.find(params[:id])
      #
      if @progress.update progress_params
        redirect_to project_url(@project), notice: 'Progress report successfully updated'
      else
        flash.now[:error] = 'Sorry try again'
        render :edit

      end
    end

    def destroy
      @progress = Progress.find(params[:id])
      @progress.destroy
      flash[:alert] = "Progress report deleted!"
      redirect_to project_url(@project)
    end

    private

    def load_project
      @project = Project.find(params[:project_id])
    end

    def progress_params
      params.require(:progress).permit(:progress_title, :progress_description)
    end
  end
