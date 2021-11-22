class User < ApplicationRecord
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
end
