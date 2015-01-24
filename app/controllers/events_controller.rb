class EventsController < ApplicationController

  before_filter :authenticate_user!, except: [:index]

  respond_to :html

  def index
    respond_with(@events = Event.all)
  end

  def new
    respond_with(@event = Event.new)
  end

  def create
    respond_with(current_user.own_events.create(event_params),location: -> {events_path})
  end

  private

  def  event_params
    params.require(:event).permit(:title)
  end
end
