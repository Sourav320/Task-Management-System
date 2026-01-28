class UserManagementController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.includes(:roles).where(is_delete: false).order(created_at: :desc)
  end

  def edit
    @roles = Role.all
  end

  def update
    if @user.update(user_params)
      if params[:user][:role_id].present?
        @user.roles = [Role.find(params[:user][:role_id])]
      end

      redirect_to user_management_index_path, notice: "User updated successfully"
    else
      @roles = Role.all
      render :edit
    end
  end

  def destroy
    @user.update(is_delete: true)
    redirect_to user_management_index_path, notice: "User deleted successfully"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :mobile_no, :email)
  end

  def authorize_admin!
    unless current_user.roles.last.name.downcase == "admin"
      redirect_to root_path, alert: "Access denied"
    end
  end
end
