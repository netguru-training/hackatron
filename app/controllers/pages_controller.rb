class PagesController < ApplicationController

  def home
    if params[:commit]
      location = Geocoder.coordinates(params[:address])
      raise 'InvalidLocation' if location.nil?
      @events = Location.includes(:events).
          near(location, 105, units: :km).
          joins(:events).
          where(events: {language_id: params[:language_id]}).
          map { |l| l.events if l.events.present? }.compact

    else
      @events = Event.all
    end
  end


end
