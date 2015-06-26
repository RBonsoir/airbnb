class AddEnddateToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :end_date, :date
  end
end
