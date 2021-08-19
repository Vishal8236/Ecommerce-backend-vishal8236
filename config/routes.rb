Rails.application.routes.draw do
  #session routes
  post '/login', to: 'session#login'  
  get '/login', to: 'session#token_authentication' 
  
  post '/signup', to: 'session#signup'

  scope '/seller'  do
    resources :shops, only: [:index, :create, :update] do
      resources :products
    end #seller shop routes

    #seller routes
    post 'all_shop', to: 'seller#index'
    post ':id/products', to: 'seller#seller_products'
    
    #seller shop routes
    post 'create_shop', to: 'seller#create_shop'
    delete 'delete_shop/:name', to: 'seller#delete_shop'
  end

end
