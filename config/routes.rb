Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :users, only: [:edit, :update, :show]
  resources :events, only: [:index, :new, :create, :show]
  
end
