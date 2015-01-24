class Comment < ActiveRecord::Base
  belongs_to :event
  
  validetes_presence_of :body
end
