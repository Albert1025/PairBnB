class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :listings, :email, :owner

  	

  	add_column :listings, :price, :decimal
  	add_column :listings, :guests, :string
  	add_column :listings, :contact, :string

  	
  end
end
