class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show 
    @user = User.find_by(id: params[:id])
    render :show
  end 



  private 
  def user_params
    params.require(:user).permit(:username,:password)
  end 
end
