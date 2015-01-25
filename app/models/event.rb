class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :participations
  has_many :participants, class_name: 'User', through: :participations
  belongs_to :location
  validates :title, :description, :creator_id, :address, :time, presence: true

  after_save :set_location


  def owner?(user)
    !user.nil? && user == self.creator
  end

  private

  def set_location
    street, city, country = self.address.split(', ')
    update_column(:location_id, Location.find_or_create_by(street: street, city: city, country: country))
  end
end
