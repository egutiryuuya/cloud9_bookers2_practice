class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books =@user.books
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user =User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  def index
    @users = User.all
    @user =current_user
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:introduction,:image)
  end
end