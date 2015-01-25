class ParticipationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    event = load_event
    unless event.participants.include? current_user
      event.participants << current_user
    end
    redirect_to event
  end

  def destroy
    participation = current_user.participations.find(params[:id])
    participation.destroy
    redirect participation.event
  end

  def approve
    participation = Participation.find(params[:id])
    if participation && participation.event.owner?(current_user)
      participation.update(allowed: true)
    else
      flash[:error] = "Can't allow people to participate"
    end

    redirect_to event_path(participation.event)
  end

  private

  def load_event
    Event.find(params[:event_id])
  end
end
