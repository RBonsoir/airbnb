class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :title
      t.text :description
      t.text :address
      t.integer :price
      t.boolean :published
      t.integer :capacity
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
