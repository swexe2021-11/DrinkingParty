class User < ApplicationRecord
    attr_accessor :password, :password_confirmation  
    has_many :rooms
    has_many :chats
end
