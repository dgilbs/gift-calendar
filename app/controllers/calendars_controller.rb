class CalendarsController < ApplicationController

  def new
    @calendar=Calendar.new
  end

  def create
    @calendar=Calendar.new(calendar_params)
    if @calendar.valid?
      @calendar.save
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
    @calendar=Calendar.find(params[:id])
  end 

  def destroy
  end

  def calendar_params
    params.require(:calendar).permit(:name, :description)
  end
end
