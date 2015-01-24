class EventsController < ApplicationController

  before_filter :authenticate_user!, except: [:index]

  respond_to :html

  expose(:event)
  expose(:events)

  def create
    respond_with(@event = current_user.own_events.create(event_params) ,location: -> {events_path})
  end

  private

  def  event_params
    params.require(:event).permit(:title,:description)
  end
end
