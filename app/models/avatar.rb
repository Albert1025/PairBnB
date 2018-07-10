class Avatar < ActiveRecord::Base
  attr_accessor :gallery_id, :name, :image
  belongs_to :user
  
end