Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  
  resources :users, only: [:show]

  resources :recipes do
    resources :comments, only: [:create]
  end
  resources :categories, only: [:show]
  resources :ingredients, only: [:show]

  resources :restaurants

  namespace :api do
    resources :recipes, only: [:index,:new]
  end

  post '/recipe/:recipe_id/likes' => "likes#create"
  delete '/recipe/:recipe_id/likes' => "likes#destroy"
end
