class Admin::UsersController < BaseController

private

  def resource
    return @user if @user
    if params[:id]
      @user = User.not_admin.find(params[:id])
    else
      @user = current_user
    end
  end

  def collection
    @users = User.page(params[:page]).per(5)
  end

  def resource_params
    params.require(:user).permit(:is_admin, :first_name, :last_name, :email, :is_banned)
  end
end
