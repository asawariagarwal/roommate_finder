Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :building_amenities

      resources :users

      resources :favorites

      resources :building_photos

      resources :listing_photos

      resources :listings

      resources :amenities

      resources :buildings

      resources :preferences

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "preferences#index"
  resources :messages
  resources :profiles
  resources :amenity_preferences
  resources :building_amenities
  devise_for :users
  resources :users
  resources :favorites
  resources :building_photos
  resources :listing_photos
  resources :listings
  resources :amenities
  resources :buildings
  resources :preferences
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
