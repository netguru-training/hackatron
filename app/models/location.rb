class Location < ActiveRecord::Base
  has_many :events
  has_many :users

  validates_presence_of :address

  geocoded_by :address
  after_validation :geocode

end
