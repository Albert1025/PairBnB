class AddUserId < ActiveRecord::Migration[5.0]
  def change
   
    add_reference :listings, :user, index: true
    add_foreign_key :listings, :users
    
  end
end