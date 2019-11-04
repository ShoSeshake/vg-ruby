Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  
  resources :users, only: [:show]

  resources :recipes
  resources :categories, only: [:show]
  resources :ingredients, only: [:show]

  namespace :api do
    resources :recipes, only: :index
  end

  post '/recipe/:recipe_id/likes' => "likes#create"
  delete '/recipe/:recipe_id/likes' => "likes#destroy"
end
