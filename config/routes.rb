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
  
  resources :room
  
  root 'room#index'
  
<<<<<<< HEAD
=======
  get 'chat/:id' => 'chat#show', as: 'chat'
>>>>>>> 668d7c2e4fb52450c0e1bbba718f17307f3029ea
  resources :chat, only: [:create]
end
