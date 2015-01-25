class ChangeAddressInLocation < ActiveRecord::Migration
  def change
    add_column :locations, :address, :string
    remove_column :locations, :street, :string
    remove_column :locations, :city, :string
    remove_column :locations, :country, :string
  end
end
