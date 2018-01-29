Rails.application.routes.draw do
  devise_for :users
  resources :locations
  root to: "locations#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
