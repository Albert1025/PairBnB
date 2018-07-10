class  Listing < ActiveRecord::Base
 belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations
end