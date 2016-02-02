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
  get 'join_plan', :to => 'plans#join_plan'
  get 'add', :to => 'users#add'
  post 'join', :to => 'users#join'
  get '/:token/confirm_email/:id', :to => "organizations#confirm_email", as: '/confirm_email'

end
