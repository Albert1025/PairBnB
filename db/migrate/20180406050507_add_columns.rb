class AddColumns < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :property_type, :string
  	add_column :listings, :place_type, :string

  end
end
