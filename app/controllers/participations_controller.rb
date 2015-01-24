class ParticipationsController < ApplicationController

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

  private

  def load_event
    Event.find(params[:event_id])
  end
end
