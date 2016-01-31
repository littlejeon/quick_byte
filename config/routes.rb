Rails.application.routes.draw do
  root 'sessions#index'
  # root 'user_organizations#index'

  # root 'welcome#index'

  resources :organizations
  resources :users
  resources :sessions
  resources :reviews
  resources :restaurants

  get '/login', :to => 'sessions#new'
  delete '/logout', :to => 'sessions#destroy'
  get '/signup', :to => 'users#new'

end
