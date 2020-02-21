Rails.application.routes.draw do
  devise_for :users
  resources :bookings
  resources :shows
  resources :movies
  resources :theatres
  root to: "movies#index"
  devise_scope :user do  
	get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
