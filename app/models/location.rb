class Location < ActiveRecord::Base
  belongs_to :event
  has_many :users

  validates_presence_of :street, :city, :country

  geocoded_by :address
  after_validation :geocode

  def address
    [street, city, country].compact.join(', ')
  end
end
