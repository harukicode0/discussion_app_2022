class Position < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :standing_position
  belongs_to :user_room

  validates :standing_position_id, numericality: true
end
