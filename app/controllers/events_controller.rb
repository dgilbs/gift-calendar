class EventsController < ApplicationController

  def new
    @event=Event.new
    @calendars=Calendar.all
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
  end 

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :notes)
  end
    
end
