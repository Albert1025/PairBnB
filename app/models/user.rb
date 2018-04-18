# In app/models/user.rb    
require 'fileutils'
class User < ApplicationRecord
	include Clearance::User
 has_many :authentications, dependent: :destroy
 has_many :listings
 mount_uploader :avatar, AvatarUploader
 has_many :reservations
 has_many :listings, :through => :reservations


 def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     email: auth_hash["extra"]["raw_info"]["email"],
     password: SecureRandom.hex(10)
   )
   user.authentications << authentication
   return user
 end

 # grab fb_token to access Facebook for user data
 def fb_token
   x = self.authentications.find_by(provider: 'facebook')
   return x.token unless x.nil?
 end

  end
