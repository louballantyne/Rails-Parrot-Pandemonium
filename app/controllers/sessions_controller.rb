class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: session_params[:username])

    if @user == nil
      redirect_to '/sessions/new', notice: "Incorrect username"
    elsif @user.authenticate(session_params[:password]) == false
      redirect_to '/sessions/new', notice: "Incorrect password"
    else
      login
      redirect_to '/', notice: "Successfully logged in"
    end
  end

  def destroy
    logout
    redirect_to '/', notice: "Successfully logged out"
  end

  private

  def session_params
    params.permit(:username, :password)
  end
end
