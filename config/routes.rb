Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
	root 'sign_out#sign_out';
	get "/auth/:provider/callback" => "sessions#create_from_omniauth";
	
  get '/reservations/:id/braintree/new' => "braintree#new", as: "braintree_new"
  post '/reservations/:id/braintree/checkout' => "braintree#checkout", as: "braintree_checkout"
  
  resources :listings do
  resources :reservations
end



	get "/user/listings" => "listings#my_listings", as: "my_listings"



  
  resources :users, except: [:create]
	# mount Listings::Engine => "../app/listings";
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end