Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  # get 'artists/index'
  # get 'artists/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artists, only: [:index, :show, :new, :create]
  resources :is_likes, only: [:index, :show, :new, :create]
  resources :comments, only: [:edit, :update, :new, :create]
  resources :users
end
