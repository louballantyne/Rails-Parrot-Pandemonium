class UsersController < ApplicationController

  def create

    @user = User.new(user_params)

    if @user.errors.present?
      redirect_to '/users/new', notice: "Please check each field is correctly filled in"
    elsif @user.save
      redirect_to '/articles', notice: "User created"
    else
      redirect_to '/users/new', notice: "Ensure username and email address are unique and that passwords match"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to '/', notice: "Successfully Updated"
    else
      render :edit, notice: "Please try again"
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
