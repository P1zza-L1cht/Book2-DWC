class UsersController < ApplicationController
  def index
    @users = User.all
    @book = current_user.id
  end

  def show
    @user = User.find(params[:id])
    @book = Book.find(@user.id)
    @books = @user.books
  end

  def edit
  end
end
