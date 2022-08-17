Rails.application.routes.draw do
  root "parks#index"
  resources :categories
  resources :playgrounds
  resources :institutions
  resources :comments
  resources :parks
  resources :users
  resources :users, only: [:show] do 
    get :favorites, on: :collection 
  end
  resources :sessions, only: %i[new create destroy]
  resources :favorites, only: [:create, :destroy]
end
