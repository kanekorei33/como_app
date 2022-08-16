Rails.application.routes.draw do
  root "parks#index"
  resources :categories
  resources :playgrounds
  resources :institutions
  resources :comments
  resources :parks
  resources :users
  resources :sessions, only: %i[new create destroy]
end
