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

  resources :cuisines

  get 'login', :to => 'sessions#new'
  delete 'logout', :to => 'sessions#destroy'
  get 'signup', :to => 'users#new'
  get 'logged_in', :to => 'sessions#index'
  get 'join', :to => 'users#join'
  get '/:id/join-plan', :to => 'plans#join_plan', :as => 'join-plan'
  delete '/:id/leave_plan', :to => 'plans#leave_plan', :as => 'leave-plan'
  get 'add', :to => 'users#add'
  post 'join/', :to => 'users#join'
  get 'dashboard/', :to =>'users#dashboard'
  get '/:token/confirm_email/:id', :to => "organizations#confirm_email", as: '/confirm_email'
  delete '/:id/remove-user/:organization', :to => 'organizations#remove_user', :as => 'remove_user'
  post 'request_access/:id', :to => "users#request_access", as: "request_access"
  get '/:token/grant_access/:id', :to => "organizations#grant_access", as: '/grant_access'

end
