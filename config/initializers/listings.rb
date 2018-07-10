# file: config/initializers/listings.rb
Listings.configure do |config|
  config.theme = 'twitter-bootstrap-3' # defaults to 'twitter-bootstrap-2'
  config.push_url = true # User html5 history push_state to allow back/forward navigation. defaults to false
end	