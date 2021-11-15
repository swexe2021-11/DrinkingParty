class Chatroom < ApplicationRecord
    has_many :rooms
    has_many :chats
end
