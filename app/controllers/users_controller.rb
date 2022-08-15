class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books =@user.books
  end
  
  def edit
    @user = User.find(params[:id])
    if @user.id ==current_user.id
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="user update successfully"
    redirect_to user_path(@user)
    else
      flash[:alert] = "is too short (minimum is 2 characters)"
      render :edit
    end
  end
  def index
    @users = User.all
    @user =current_user
    @book = Book.new
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:introduction,:image)
  end
end
