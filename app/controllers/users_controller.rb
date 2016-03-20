class UsersController < ApplicationController
  has_secure_password

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to @user 
    else
      render :new
    end
  end

  def edit
  end

  def update 
  end 

  def index
  end

  def show
    @user=User.find(params[:id])
  end 

  def destroy
  end  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end