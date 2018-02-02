Rails.application.routes.draw do
  devise_for :users
  # resources :locations
  get '/locations', to: 'locations#index'
  post '/locations', to: 'locations#create', as: 'new_location'
  delete '/locations', to: 'locations#delete_all', as: 'delete_all_locations'
  root to: "locations#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
