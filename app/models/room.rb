class Room < ApplicationRecord
<<<<<<< HEAD
    has_many :users, through: :user_rooms
    has_many :user_rooms, dependent: :destroy
    validates :title, presence: true
=======

>>>>>>> c406ff981eaa3a523e0d4f1cb8311c8a8b7c94b3
end
