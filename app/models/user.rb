class User < ApplicationRecord
<<<<<<< HEAD
    attr_accessor :password, :password_confirmation  
=======
    has_many :rooms
    has_many :chats
>>>>>>> 2a63ad1b95e3d9c9b9246a6d5f5f652f3b9da250
end
