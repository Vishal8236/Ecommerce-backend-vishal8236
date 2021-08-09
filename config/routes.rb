Rails.application.routes.draw do
  #session routes
  post '/login', to: 'session#login'  
  get '/login', to: 'session#token_authentication' 
  
  post '/signup', to: 'session#signup'

  #seller routes
  post '/seller/all_shop', to: 'seller#index'
  post 'seller/:id/products', to: 'seller#seller_products'
end
