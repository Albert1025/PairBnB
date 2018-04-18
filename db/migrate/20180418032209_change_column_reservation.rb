class ChangeColumnReservation < ActiveRecord::Migration[5.0]
  change_column :reservations, :date_in, 'date USING CAST(date_in AS date)'
  change_column :reservations, :date_out, 'date USING CAST(date_out AS date)'
end