class User < ApplicationRecord
    
    has_many :user_rooms, dependent: :destroy
    has_many :chats, dependent: :destroy
    
    validates :password, presence: true, confirmation: true
    
    attr_accessor :password, :password_confirmation
    
    def password=(val)
        if val.present?
          self.pass = BCrypt::Password.create(val)
        end
        @password = val
    end
end
