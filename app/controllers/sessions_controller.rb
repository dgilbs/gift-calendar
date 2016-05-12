class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
  end


  # def create
  #   @user = User.find_by_email(params[:email])
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to calendars_path
  #   else
  #     flash.now.alert= "Email or password is invalid"
  #     render :new
  #   end
  # end

  # def destroy
  #   session[:user_id] = nil 
  #   redirect_to new_session_path, notice: "Logged Out"
  # end
end
