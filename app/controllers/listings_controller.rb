class ListingsController < ApplicationController

	before_action :check_user, except: [:edit, :new, :update, :destroy]

	def index
		@listings = Listing.paginate(:page => params[:page], :per_page => 5)

	end

	def show
		@listing = Listing.find(params[:id])

	end

	def new
		@listing = Listing.new

	end

	def create
		
		@listing = current_user.listings.new(allowed_params)
		if @listing.save
			redirect_to listings_path
		else
			render	'new'
		end
	end

	def edit
		@listing = Listing.find(params[:id]) 
	end

	def update
		@listing = Listing.find(params[:id])
		if @listing.update_attributes(allowed_params)
			redirect_to listings_path
		else
			render	'new'
		end
	end

	def destroy
		@listing = Listing.find(params[:id]) 
		@listing.destroy
		redirect_to listings_path
	end

	def my_listings
		@listings = current_user.listings
	end

	private 
		def allowed_params
			params.require(:listing).permit(:owner, :address, :property_type, :place_type, :price, :guests, :contact)
		end

	private
		def check_user
			if !current_user
				redirect_to '/sign_in'
			end
		end
end