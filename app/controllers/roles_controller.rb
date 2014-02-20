class RolesController < ApplicationController
  def index
    @roles = Role.all
    if !@roles.nil?
      @roles = @roles.page(params[:page]).per(6)
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
    end
  end

  def show
    @role = Role.find(params[:id])
  end

  private

  def role_params
    params.require(:role).permit(:name, :description)
  end
end
