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
<<<<<<< HEAD
  
  
=======

  get 'chat/:id' => 'chats#show', as: 'chat'

  resources :chats, only: [:create]
>>>>>>> c406ff981eaa3a523e0d4f1cb8311c8a8b7c94b3
end
