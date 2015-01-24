class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :participations
  has_many :participants, class_name: 'User', through: :participations

end
