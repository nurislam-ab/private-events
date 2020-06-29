class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @events = Event.all
    @upcomming_events = Event.upcomming.order(date: :desc)
    @past_events = Event.past.order(date: :desc)
  end

  def show
    @event = Event.find(params[:id])
    @user = current_user
    
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
