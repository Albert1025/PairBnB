class Reservations < ActiveRecord::Migration[5.0]
  def change
  	 create_table :reservations do |t|
      t.integer :user_id
      t.integer :listing_id

      t.timestamps null: false
  end

  	add_index :reservations, :user_id
  	add_index :reservations, :listing_id

  end
end