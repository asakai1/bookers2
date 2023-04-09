class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/books'
  end

  def index
    @book = Book.all
    @user = User.find(params[:user_id])
  end

  def show
  end

def book_params
    params.require(:book).permit(:title, :body)
  end

end
