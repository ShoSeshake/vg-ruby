Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  
  resources :users, only: [:show]

  resources :recipes
  resources :categories, only: [:index, :show]

  namespace :api do
    resources :recipes, only: :index
  end
end
