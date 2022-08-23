Rails.application.routes.draw do

  get "/admin", to: "application#check"
  mount RailsAdmin::Engine => '/admins', as: 'rails_admin'

  root "parks#top"

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
