class AddMoreColumnsToReservations < ActiveRecord::Migration[5.0]
  def change

 		add_column :reservations, :email, :string
 		add_column :reservations, :address, :string



  	add_index :reservations, :email
  	add_index :reservations, :address

  end
end
