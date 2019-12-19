class ProjectsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[catalog index show]
  before_action :access, only: %i[new create edit update destroy]

  def catalog
    @projects = Project.all
    @projects_amount = @projects.length
    @users_amount = User.count
  end

  def index
    @user = User.find(params[:user_id])
    @is_owner = user_signed_in? && current_user.id == @user.id
    @projects = Project.where(user_id: params[:user_id])
    @projects_amount = @projects.length
  end

  def show
    @project = Project.find(params[:id])
    @user = User.find(@project.user.id)
    @is_owner = user_signed_in? && current_user.id == @user.id
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    current_user.projects.push(@project)
    if @project.save
      flash[:success] = 'El proyecto ha sido creado con éxito!'
    else
      flash[:warning] = 'No se ha podido crear el proyecto.'
    end
    redirect_to user_projects_path(current_user)
  end

  def edit
  end

  def update
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = 'Se ha eliminado el proyecto correctamente.'
    redirect_to user_projects_path(current_user)
  end

  private

  def project_params
    params.require(:project).permit(:title, :code, :user_id, :snapshot)
  end

  def access
    if current_user.id != params[:user_id].to_i
      flash[:warning] = 'No tienes permiso para ejecutar esta acción.'
      redirect_back fallback_location: root_path
    end
  end
end
