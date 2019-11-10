Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  
  resources :users, only: [:show] do
    member do
      get :following, :followers, :users_tweets
    end
  end
  resources :relationships, only: [:create, :destroy]


  resources :recipes do
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
  end
  resources :categories, only: [:show]
  resources :ingredients, only: [:show]
  resources :genres, only: [:show]

  resources :restaurants do
    resources :restaurant_comments, only: [:create]
  end

  namespace :api do
    resources :recipes, only: [:index,:new]
  end

  post '/recipe/:recipe_id/likes' => "likes#create"
  delete '/recipe/:recipe_id/likes' => "likes#destroy"
end
