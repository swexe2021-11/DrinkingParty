class Chatroom < ApplicationRecord
    has_many :user_rooms
    has_many :chats
end
