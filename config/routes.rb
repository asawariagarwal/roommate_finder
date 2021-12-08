Rails.application.routes.draw do
  resources :amenities
  resources :buildings
  resources :preferences
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
