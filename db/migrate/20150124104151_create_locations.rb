class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :street
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
