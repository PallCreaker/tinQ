class UsersController < ApplicationController
  def index
  end

  def show
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
