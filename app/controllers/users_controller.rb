class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.create(user_params)
  end
  def destroy
    @user = User.find(params[:id])

    @user.destroy
  end
  private

    def user_params
      params.require(:user).permit(:text)
    end
end
