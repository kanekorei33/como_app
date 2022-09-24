Rails.application.routes.draw do

  root "parks#top"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post '/guest', to: 'guest_sessions#create'
  post '/guest_admin', to: 'guest_sessions#create_admin'

  resources :categories
  resources :playgrounds
  resources :institutions
  resources :parks do
    resources :comments do
      resources :posts
    end
    collection do
      get 'search'
    end
    collection do
      get 'map_index'
    end
  end
  resources :users
  resources :users, only: [:show] do
    get :favorites, on: :collection
  end
  resources :sessions, only: %i[new create destroy]
  resources :favorites, only: [:create, :destroy]
  resources :comments do
    collection do
      get 'search'
    end
  end
end
