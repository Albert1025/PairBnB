class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	# validates :date_in, :date_out
  validate :overlaps, on: :create

  # Check if a given interval overlaps this interval
  def overlaps 
    self.listing.reservations.each {|t|
    x = (t.date_in..t.date_out).to_a
    y = (date_in..date_out).to_a
    unless (x & y).empty?
      errors.add(:ascm, 'overlap')

      break
    end
  }
  end

  def total_amount
    a = (self.date_out - self.date_in).to_i
    b = self.listing.price
    a * b.to_i
  end  


end