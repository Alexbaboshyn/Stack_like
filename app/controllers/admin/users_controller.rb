class Admin::UsersController < BaseController

private

  def resource
    @user = User.not_admin.find(params[:id])
  end

  def collection
    @users = User.page(params[:page]).per(5)
  end

  def resource_params
    params.require(:user).permit(:is_admin, :first_name, :last_name, :email, :password, :password_confirmation)
  end
end
