class UsersController < ApplicationController
  has_many :messages
  
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

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
