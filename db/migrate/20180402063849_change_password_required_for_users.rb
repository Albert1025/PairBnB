class ChangePasswordRequiredForUsers < ActiveRecord::Migration[5.0]
  def change
  	 change_column_null :user, :encrypted_password, true
  end
end