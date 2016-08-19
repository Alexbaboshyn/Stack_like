class Api::UsersController < ApplicationController
skip_before_action :authenticate, only: [:create]

  def create
    super
    head :unprocessable_entity unless resource.valid?
    head :created
  end

  private
  def build_resource
    @user = User.new resource_params
  end

  def resource
    @user
  end

  def collection
    @users = User.page(params[:page]).per(5)
  end

  def resource_params
    params.require(:user).permit(:is_admin, :first_name, :last_name, :email, :password, :password_confirmation)
  end
end
