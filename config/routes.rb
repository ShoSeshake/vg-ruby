Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  
  resources :users, only: [:show]
  resources :chats, only: [:new,:create] do
    namespace :api do
      resources :messages, only: [:index] 
  
    end
  end
  resources :messages, only:[:index,:show,:new,:create] do
    collection do
      get 'reload', defaults: { format: 'json' }
    end
  end

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
    resources :messages, except: [:index, :new,:create,:show,:edit,:update,:destroy] do
      collection do
        get 'reload'
      end
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  post '/recipe/:recipe_id/likes' => "likes#create"
  delete '/recipe/:recipe_id/likes' => "likes#destroy"
end
