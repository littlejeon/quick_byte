Rails.application.routes.draw do
  # root 'sessions#index'
  # root 'user_organizations#index'

  root 'welcome#index'

  resources :organizations
  resources :users
  resources :sessions
  resources :reviews
  resources :restaurants
  resources :plans

  resources :types

  get 'login', :to => 'sessions#new'
  delete 'logout', :to => 'sessions#destroy'
  get 'signup', :to => 'users#new'
  get 'logged_in', :to => 'sessions#index'
  get 'join', :to => 'users#join'
  get '/:id/join-plan', :to => 'plans#join_plan', :as => 'join-plan'
  delete '/:id/leave_plan', :to => 'plans#leave_plan', :as => 'leave-plan'
  get 'add', :to => 'users#add'
  post 'join', :to => 'users#join'


end
