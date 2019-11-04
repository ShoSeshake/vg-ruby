Rails.application.routes.draw do
  devise_for :users
  root to: 'recipe#index'
  
  resources :users, only: [:show]

  resources :recipes

  namespace :api do
    resources :recipes, only: :index
  end
end
