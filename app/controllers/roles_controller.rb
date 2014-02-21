class RolesController < ApplicationController

  #caches_action :index#, :cache_path => (proc { role_path(params[:id], :user_id => current_user.id })

  def index
    @roles = Role.all
    if !@roles.nil?
      #@roles = @roles.page(params[:page]).per(6)
    end
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)

    if @role.save
      flash[:notice] = "Role has been created."
      redirect_to @role
    else
      flash[:alert] = "Role has not been created."
      render 'new'
    end
  end

  def show
    @role = Role.find(params[:id])
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    if @role.update(role_params)
      flash[:notice] = "Role has been updated."
      redirect_to @role
    else
      flash[:alert] = "Role has not been updated."
      render 'edit'
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    flash[:notice] = "Role has been destroyed."
    redirect_to roles_path    
  end

  private

  def role_params
    params.require(:role).permit(:name, :description)
  end
end
