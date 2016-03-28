class EventsController < ApplicationController
  before_filter :authorize

  def new
    @event=Event.new
    @user=User.find(session[:user_id])
    @calendars=@user.calendars
  end

  def create
    @calendar=Calendar.find(params[:event][:calendar_id])
    @event=Event.new(event_params)

    user = User.find(session[:user_id])
    if @event.valid?
      @event.calendar=@calendar
      @event.user = user
      @event.save
      redirect_to @calendar 
    else
      render :new
    end


  end

  def edit
    @event = Event.find(params[:id])
    @user = User.find(session[:user_id])
    @calendars = @user.calendars
  end

  def update 
    @event = Event.find(params[:id])
    @event.calendar = Calendar.find(params[:event][:calendar_id])
    if @event.update(event_params)
      redirect_to @event 
    else
      render :edit
    end
  end 

  def index
  end

  def show
    @event=Event.find(params[:id])
  end 

  def destroy
    @event = Event.find(params[:id])
    @calendar = @event.calendar
    @event.destroy
    redirect_to @calendar
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :notes)
  end
    
end
