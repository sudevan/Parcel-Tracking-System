Rails.application.routes.draw do
  resources :parcel_routes
  get 'dashboard/index'
  resources :consignments
  devise_for :users
  root to:  'public#main'
  get 'consignments/:id/approve' => 'consignments#approve', as: :approve_consignment
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
