class ProjectsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :code, :user_id)
  end
end
