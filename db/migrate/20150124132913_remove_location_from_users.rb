class RemoveLocationFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :street
    remove_column :users, :city
    remove_column :users, :country
    add_column :users, :address, :string
  end
end
