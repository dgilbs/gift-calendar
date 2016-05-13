class SessionsController < ApplicationController
  def new
  end


  def create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.name}!"
    redirect_to user_path(@user)
  end


  def destroy
    session[:user_id] = nil 
    redirect_to new_session_path, notice: "Logged Out"
  end
end
