Rails.application.routes.draw do

  resources :user
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  
  get 'top2/main'
  post 'top2/login'
  get 'top2/logout'
  
  resources :room
  
  root 'room#index'
  
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
