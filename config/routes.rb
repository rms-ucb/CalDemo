Rails.application.routes.draw do
  get 'events/index'
  resources :events, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :total_count
  root 'events#index'
end
