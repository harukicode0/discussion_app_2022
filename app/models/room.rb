class Room < ApplicationRecord
  has_many :users, through: :user_room
  has_many :comments

  with_options presence: true do
    validates :name
    validates :maker_user
  end
end
