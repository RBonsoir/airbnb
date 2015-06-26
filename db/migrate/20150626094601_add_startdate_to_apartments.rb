class AddStartdateToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :start_date, :date
  end
end
