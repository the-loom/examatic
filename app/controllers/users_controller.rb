class UsersController < ApplicationController
  before_action :check_admin!

  def index
    @users = User.all
  end

  def toggle_enabled
    @user = User.find(params[:id])
    @user.toggle_enabled!

    redirect_to users_path
  end
end
