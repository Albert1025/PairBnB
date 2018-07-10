class BraintreeController < ApplicationController
  def new
  	@client_token = Braintree::ClientToken.generate
     @reservation = Reservation.find(params[:id])

  end

  def checkout
  @reservation = Reservation.find(params[:id])
  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
  result = Braintree::Transaction.sale(
   
   :amount => @reservation.total_amount, #this is currently hardcoded

   :payment_method_nonce => nonce_from_the_client,
   :options => {
   :submit_for_settlement => true

    }
   )

  if result.success?
    redirect_to braintree_new_path(@reservation), :flash => { :success => "Transaction successful!" }
  else
    redirect_to braintree_new_path(@reservation), :flash => { :error => "Transaction failed. Please try again." }
  end
end


end