class Room < ApplicationRecord
    has_many :users, through: :user_rooms
    has_many :user_rooms, dependent: :destroy
    validates :title, presence: true
end
