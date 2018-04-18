class AddColumnToReservation < ActiveRecord::Migration[5.0]
 		add_column :reservations, :date_in, :string
 		add_column :reservations, :date_out, :string
 end
