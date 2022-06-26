class Comment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :standing_position
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :text
  end
  validates :standing_position_id, numericality: true
end
