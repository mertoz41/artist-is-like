Rails.application.routes.draw do
  

  get 'is_likes/:id/comments/new', to: "comments#new", as: "like_comment"

  get 'sessions/new'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'login', to: "sessions#destroy"
  # get 'artists/index'
  # get 'artists/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artists, only: [:index, :show, :new, :create]
  resources :is_likes, only: [:index, :show, :new, :create]
  resources :comments, only: [:edit, :update, :new, :create]
  resources :users
end
