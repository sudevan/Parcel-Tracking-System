Rails.application.routes.draw do
  get 'dashboard/index'
  resources :consignments
  devise_for :users
  root to:  'public#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
