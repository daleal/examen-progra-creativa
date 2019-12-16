class ProjectsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:catalog, :index, :show]

  def catalog
    @projects = Project.all
    @projects_amount = @projects.length
    @users_amount = User.count
  end

  def index
    @user = User.find(params[:user_id])
    @owner = user_signed_in? && current_user.id == @user.id
    @projects = Project.where(user_id: params[:user_id])
    @projects_amount = @projects.length
    puts "hola"
  end

  def show
    @project = Project.find(params[:id])
    @user = User.find(@project.user.id)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    current_user.projects.push(@project)
    if @project.save
      flash[:success] = "El proyecto ha sido creado con éxito!"
    else
      flash[:warning] = "No se ha podido crear el proyecto."
    end
    redirect_to user_projects_path(current_user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :code, :user_id, :snapshot)
  end
end
