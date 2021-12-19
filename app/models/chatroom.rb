class Chatroom < ApplicationRecord
    has_many :chatroom_to_users
    has_many :users, through: :chatroom_to_users

    has_many :chat, dependent: :destroy
end
