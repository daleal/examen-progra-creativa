class ProjectsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:catalog, :index, :show]

  def catalog
    @projects = Project.all
    @projects_amount = @projects.length
    @users_amount = User.count
  end

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
