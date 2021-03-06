class UsersController < ApplicationController

  before_action :baria_user, only: [:edit, :destroy, :update]


  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully"
    else
      render :edit
    end
  end


  def index
    @users = User.all
  end

private

def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end

def baria_user
  unless User.find(params[:id]).id == current_user.id
    redirect_to user_path(current_user.id)
  end
end


end
