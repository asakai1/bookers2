class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.all
  end

  def show
    @user = current_user
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      redirect_to book_path(book.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    @user = current_user
    @books = Book.find(params[:id])
    render :show
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
