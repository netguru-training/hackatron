class Location < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validetes_presence_of :street, :city, :country
end
