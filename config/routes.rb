Web::Application.routes.draw do

  # Static pages
  get 'static_pages/home'
  get 'static_pages/contact'

  match '/index', to: 'static_pages#home'
  match '/home', to: 'static_pages#home'
  match '/contact', to: 'static_pages#contact'

  root :to => 'static_pages#home'

  resources :users
  match '/signup',  :to => 'users#new'
  match '/users/:id', :to => 'users#show', :as => :user

  # Omniauth pure
  match "/signin" => "services#signin"
  match "/signout" => "services#signout"
  
  match '/auth/:service/callback' => 'services#create' 
  match '/auth/failure' => 'services#failure'
  
  resources :services, :only => [:index, :create, :destroy] do
    collection do
      get 'signin'
      get 'signout'
      get 'signup'
      post 'newaccount'
      get 'failure'
    end
  end
  
  get "pages/search"

  get "pages/view"

  get "pages/apply"

  get "pages/profile"

  get "home/index"
end
