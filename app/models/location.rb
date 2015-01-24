class Location < ActiveRecord::Base
  belongs_to :event

  validates_presence_of :street, :city, :country

  attr_accessible :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode

  def address
    [street, city, country].compact.join(', ')
  end
end
