class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :checkin_on
      t.date :checkout_on
      t.references :user, index: true, foreign_key: true
      t.references :apartment, index: true, foreign_key: true
      t.string :state

      t.timestamps null: false
    end
  end
end
