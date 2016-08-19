class Api::MesController < ApplicationController
skip_before_action :authenticate

  private
  def resource
    @user = current_user
  end

end
