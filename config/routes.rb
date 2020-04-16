Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :albums do 
  	collection do
  		get :add_image
  		get :profile
  	end
  end
  get '/profile', to: "albums#profile"
end
