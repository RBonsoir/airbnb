class AddCityToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :city, :string
  end
end
