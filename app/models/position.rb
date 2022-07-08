class Position < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :standing_position
  belongs_to :user_room
  has_many :issue_comments
  validates :standing_position_id, numericality: true
end
