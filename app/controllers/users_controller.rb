class UsersController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = current_user
    @book = Book.new
    @users = User.find(params[:id])
    @books = @users.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      @user.update(user_params)
      @books = @user.books
      render :show
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
