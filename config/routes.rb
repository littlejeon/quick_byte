Rails.application.routes.draw do
  root 'welcome#index'
  get 'sessions/create'

  get 'sessions/new'



  get '/login', :to => 'sessions#login'
  delete '/logout', :to => 'sessions#destroy'
  get '/signup', :to => 'users#new'


  get 'sessions/destroy'


  get 'sessions/show'

  resources :users
  resources :sessions
  resources :reviews
  resources :restaurants
end




