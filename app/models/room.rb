class Room < ApplicationRecord
  has_many :users, through: :user_room
  has_many :comments
end
