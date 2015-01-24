class Comment < ActiveRecord::Base
  belongs_to :event
  
  validates_presence_of :body
end
