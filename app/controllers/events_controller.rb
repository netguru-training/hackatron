class EventsController < ApplicationController

  before_filter :authenticate_user!, except: [:index]

  expose(:event, attributes: :event_params)
  expose(:events)

  def create
    event.creator = current_user
    if event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def destroy
    if current_user != event.creator
      redirect_to :back
      flash[:error] = "Can't remove #{event.creator.email}'s event"
    else
      event.destroy
      flash[:notice] = "Event was removed"
      redirect_to events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :address)
  end
end
