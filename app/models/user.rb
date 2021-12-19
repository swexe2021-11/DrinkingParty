class User < ApplicationRecord
    validates :uid, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true,length: {minimum:4, maximum: 8}

    has_many :chatroom_to_users
    has_many :chatrooms, through: :chatroom_to_users
    has_many :chats
    has_many :rooms
    has_many :user_rooms

    
    attr_accessor :password, :password_confirmation
    
    def password=(val)
        if val.present?
          self.pass = BCrypt::Password.create(val)
        end
        @password = val
    end
    
end
