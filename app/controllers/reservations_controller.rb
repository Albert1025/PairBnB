class ReservationsController < ApplicationController
	
	def index
	 	@reservations = Reservation.all
	  end

	def show
		@reservations = Reservation.current_user.all
	end
	
	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(allowed_res_params)
		@listing = Listing.find(params[:listing_id])
		@reservation.user_id = current_user.id
		@reservation.listing_id = @listing.id
		@reservation.email = current_user.email
		@reservation.address = @listing.address

		if @reservation.save
			redirect_to braintree_new_path(@reservation.id)
		else
	  @notice = 'Booking failed: due to overlapping booking, not enough space.'
      flash[:alert] = @notice
			render	'new'
		end
	end

	def edit

	end

	def update

	end

	def destroy
		@reservation = Reservation.find(params[:listing_id]) 
		@listing.destroy
		redirect_to listings_path
	end





	private

	def allowed_res_params
		params.require(:reservation).permit(:user_id, :listing_id, :date_in, :date_out)
	end

	def check_dates

	end

end