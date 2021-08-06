Rails.application.routes.draw do
  #session routes
  post '/login', to: 'session#login'  
  get '/login', to: 'session#token_authentication' 
  
  post '/signup', to: 'session#signup'
end
