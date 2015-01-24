class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :participations
  has_many :participants, class_name: 'User', through: :participations
  belongs_to :location
  validates :title, :description, presence: true

  after_create :create_location


  def owner?(user)
    !user.nil? && user == self.creator
  end

  private

  def create_location
    street, city, country = self.address.split(', ')
    location = Location.find_or_create_by(street: street, city: city, country: country)
    save
  end

end
