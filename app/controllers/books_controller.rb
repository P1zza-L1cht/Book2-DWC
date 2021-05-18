class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @new = Book.new
  end

  def create
    @new = Book.new(book_params)
    @new.user_id = current_user.id
    if @new.save
    redirect_to book_path(@new.id), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice:"You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
