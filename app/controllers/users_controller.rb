class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
   @books = @user.books.page(params[:page]).reverse_order
   @book = Book.new
  end

  def index
    @user = User.new
    @users = User.page(params[:page]).reverse_order
    @book = Book.new
  end



  def edit
    @user = User.find(params[:id])
  end

  def update

    @book = Book.new
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] ="You have updated book successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
