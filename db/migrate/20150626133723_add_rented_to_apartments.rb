class AddRentedToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :rented, :boolean, default: false
  end
end
