class UsersController < ApplicationController
  def index
  end

  def show
  end

  #いらないかもしれない
  #def new
    #@user = User.new()
  #end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :name)
  end
end
