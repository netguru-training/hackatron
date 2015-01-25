class Location < ActiveRecord::Base
  belongs_to :event
  has_many :users

  validates_presence_of :address

  geocoded_by :address
  after_validation :geocode

end
