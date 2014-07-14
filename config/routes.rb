RailsStripeMembershipSaas::Application.routes.draw do
  resources :pets
  match "prints" => "prints#index" 


  resources :accounts

  mount StripeEvent::Engine => '/stripe'
  resources :invoices
  get "calendar/index"
  resources :visits
  resources :visit_blocks
  resources :default_prices
  resources :clients do
  	collection { post :import }
    get :download, :on => :collection
    resources :pets
	end
  resources :client_prices
  authenticated :user do
    root :to => 'visits#index'
  end
  match "/help" => "help#index"
  match "index.html" => "home#index"
  match "cgi-sys/defaultwebpage.cgi" => "home#index"
  devise_scope :user do
    get "/" => "devise/sessions#new"
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  devise_for :users, :controllers => { :registrations => 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
end