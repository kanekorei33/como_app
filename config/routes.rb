Rails.application.routes.draw do
  root "tops#index"
  resources :tops, only: [:index]
  resources :categories
  resources :playgrounds
  resources :institutions
  resources :parks do
    resources :comments do
      resources :posts
    end
  end
  resources :users
  resources :users, only: [:show] do
    get :favorites, on: :collection
  end
  resources :sessions, only: %i[new create destroy]
  resources :favorites, only: [:create, :destroy]
end
