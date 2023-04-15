class BooksController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
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
    flash[:notice] = "You have updated book successfully."
    render :show
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    user = @book.user
    unless user.id == current_user.id
      redirect_to user_path
    end
  end

end
