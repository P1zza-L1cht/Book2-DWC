class UsersController < ApplicationController
  def index
    @users = User.all
    @new = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = @user.id
    @books = @user.books
    @new = Book.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
