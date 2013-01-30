RailsStripeMembershipSaas::Application.routes.draw do
  resources :default_prices


  resources :clients do
  	collection { post :import }
	end


  mount StripeEvent::Engine => '/stripe'
  get "clients/gold"
  get "content/silver"
  get "content/platinum"
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users
end