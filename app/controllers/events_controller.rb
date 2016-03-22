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
    if @event.valid?
      @event.calendar=@calendar
      @event.save
      redirect_to @calendar 
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
    @event=Event.find(params[:id])
  end 

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :notes)
  end
    
end
