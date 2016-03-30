class EventsController < ApplicationController
  before_filter :authorize

  def new
    @event=Event.new
    @user=User.find(session[:user_id])
    @event.notes.build
    @event.notes.build
    @event.notes.build
  end

  def create
    @calendar=Calendar.find(params[:event][:calendar_id])
    @event=Event.new(event_params)
    user = User.find(session[:user_id])
    if @event.valid?
      @event.calendar=@calendar
      @event.user = user
      reminder_date = (@event.date.to_datetime - 7.days) + 11.hours
      # EventMailer.reminder_email(@event).deliver_later!(wait_until: reminder_date)
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
    @event.notes.build
    @event.notes.build
    @event.notes.build
  end

  def update 
    @event = Event.find(params[:id])
    @event.notes.clear 
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
    @notes = @event.content_notes
  end 

  def destroy
    @event = Event.find(params[:id])
    @calendar = @event.calendar
    @event.destroy
    redirect_to @calendar
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :calendar_id, notes_attributes:[:content])
  end
    
end
