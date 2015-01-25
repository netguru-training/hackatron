class PagesController < ApplicationController

  def home
    if params[:commit]
      @search_form = SearchParams.new(search_params)
      location = Geocoder.coordinates(@search_form.address)
      if location.nil?
        flash[:error] = "Sorry We can't find your location"
        render and return
      end
      @events = Location.includes(:events).
          near(location, @search_form.radius, units: :km).
          joins(:events)
      @events = @events.where(events: {language_id: @search_form.language_id}) if @search_form.language_id.present?
      @events = @events.map { |l| l.events if l.events.present? }.compact
    else
      @search_form = SearchParams.new(language_id: '', radius: 10, address: current_address)
    end
  end


  private
  def current_address
    if current_user
      current_user.location.address
    else
      request.location.address
    end
  end

  def search_params
    params.require(:search_params).permit(:language_id, :radius, :address)
  end

end
