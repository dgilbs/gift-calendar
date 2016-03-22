class CalendarsController < ApplicationController
  before_filter :authorize

  def new
    @calendar=Calendar.new
  end

  def create
    @user=User.find(session[:user_id])
    @calendar=Calendar.new(calendar_params)
    if @calendar.valid?
      @calendar.user=@user
      @calendar.save
      redirect_to @calendar 
    else
      render :new
    end
  end

  def edit
    @calendar=Calendar.find(params[:id])
  end

  def update
    @calendar=Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      redirect_to @calendar
    else
      render :edit
    end
  end 

  def index
    @user=User.find(session[:user_id])
    @calendars=@user.calendars
  end

  def show
    @calendar=Calendar.find(params[:id])
  end 

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar_name=@calendar.name
    @calendar.destroy
    redirect_to calendars_path, notice: "@calendar_name has been deleted."
  end

  def calendar_params
    params.require(:calendar).permit(:name, :description)
  end
end
