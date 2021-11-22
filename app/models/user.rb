class User < ApplicationRecord
<<<<<<< HEAD
    attr_accessor :password, :password_confirmation  
    has_many :rooms
    has_many :chats
=======
    has_many :rooms
    has_many :chats
    
    validates :password, presence: true, confirmation: true
    attr_accessor :password, :password_confirmation
    
    def password=(val)
        if val.present?
          self.pass = BCrypt::Password.create(val)
        end
        @password = val
    end
>>>>>>> b6b86766bb1bc66dce30c88ec1c61d90a9b168df
end
