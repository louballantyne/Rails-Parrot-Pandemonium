class ApplicationController < ActionController::Base

  helper_method :login, :logout

  def login
    session[:user_id] = @user.id
    session[:username] = session_params[:username]
  end

  def logout
    session.clear
  end
end
