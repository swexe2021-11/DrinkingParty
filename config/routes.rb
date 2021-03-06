Rails.application.routes.draw do

  resources :user, only: [:index, :new, :create, :destroy]
  
  resources :adminuser, only: [:index, :new, :create, :destroy]
  
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  
  get 'top2/main'
  post 'top2/login'
  get 'top2/logout'
  
  get 'get_image/:id', to: 'rooms#get_image'
  
  resources :chats
  post "chats" => "chats#create"
  
  resources :rooms
  
  root 'rooms#index'


end
