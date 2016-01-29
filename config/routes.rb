Rails.application.routes.draw do
  root 'welcome#index'
  
  get '/login', :to => 'sessions#login'
  delete '/logout', :to => 'sessions#destroy'
  get '/signup', :to => 'users#new'

  resources :users
  resources :sessions
  resources :reviews
  resources :restaurants
end
