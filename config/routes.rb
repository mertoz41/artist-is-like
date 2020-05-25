Rails.application.routes.draw do
  
 
  # get 'artists/index'
  # get 'artists/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artists, only: [:index, :show, :new, :create]
  resources :is_likes, only: [:index, :show, :new, :create]
  resources :users
end
