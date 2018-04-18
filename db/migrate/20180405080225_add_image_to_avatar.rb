class AddImageToAvatar < ActiveRecord::Migration[5.0]
  def change
    create_table :avatar do |t|
     t.string :image

    	end
	end
end