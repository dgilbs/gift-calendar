class UsersController < ApplicationController


  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user).deliver      
      @user.save
      redirect_to calendars_path
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

  def past_events
    @user = User.find(session[:user_id])
    @events = @user.past_events.sort_by{|event| event.date}
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
