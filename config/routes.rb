Rails.application.routes.draw do
  root 'welcome#index'

  resources :organizations
  resources :users
  resources :sessions
  resources :reviews
  resources :restaurants
  resources :plans

  get '/login', :to => 'sessions#new'
  delete '/logout', :to => 'sessions#destroy'
  get '/signup', :to => 'users#new'

end
