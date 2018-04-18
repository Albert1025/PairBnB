# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {
	password:SecureRandom.hex(10)
}

ActiveRecord::Base.transaction do
  20.times do 
  
    user['email'] = Faker::Internet.email
   

    User.create(user)
  end
end 


# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['owner'] = Faker::App.name
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    listing['address'] = Faker::Address.street_address
    listing['guests'] = rand(1..10)
    listing['price'] = rand(80..500)
    listing['contact'] = Faker::PhoneNumber.phone_number

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end