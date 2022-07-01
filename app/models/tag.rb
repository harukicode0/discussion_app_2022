class Tag < ApplicationRecord
  has_many :room_tags, dependent: :destroy
  has_many :rooms, through: :room_tags
end
