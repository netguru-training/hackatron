class AddLocationToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :location, index: true
    add_foreign_key :events, :locations
  end
end
