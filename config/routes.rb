Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  
  resources :users, only: [:show]
  resources :chats, only: [:new,:create,:edit,:update,:destroy] do
    namespace :api do
      resources :messages, only: [:index] 
    end
  end
  resources :messages, only:[:index,:create]

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
    resources :recipes, only: [:index,:new] do
      collection do
        get 'search'
      end
    end   
    resources :messages, except: [:index, :new,:create,:show,:edit,:update,:destroy] do
      collection do
        get 'reload', defaults: { format: 'js' }
        get 'previous', defaults: { format: 'js' }
      end
    end
    resources :restaurants, except: [:index, :new,:create,:show,:edit,:update,:destroy] do
      collection do
        get 'search'
        get 'detail'
      end
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  post '/recipe/:recipe_id/likes' => "likes#create"
  delete '/recipe/:recipe_id/likes' => "likes#destroy"
end
