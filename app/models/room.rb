class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms
  has_many :comments

  with_options presence: true do
    validates :name
    validates :maker_user
  end
end
