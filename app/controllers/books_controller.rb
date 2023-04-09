class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
  end

def book_params
    params.require(:book).permit(:title, :body)
end

end
