Rails.application.routes.draw do
  resources :parcel_routes
  get 'dashboard/index'
  resources :consignments
  devise_for :users
  
  get 'consignments/:id/approve' => 'consignments#approve', as: :approve_consignment
  get 'public/track' => 'public#track', as: :pub_track_consignment
  get 'track/track' => 'track#track', as: :track_consignment
  get 'track/history' => 'track#history', as: :track_showhistory
  get 'public/trackshow' => 'public#trackshow', as: :trackshow_consignment
  root to:  'public#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
