Rails.application.routes.draw do
  devise_for :users
  resources :storages do
    resources :products
  end
  resources :product_types
  get 'search/:storage_id' => 'search#index', as: 'search'
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
