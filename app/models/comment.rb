class Comment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :standing_position
  belongs_to :user
  belongs_to :room
  has_many :likes,dependent: :destroy

  with_options presence: true do
    validates :text
  end
  validates :standing_position_id, numericality: true

  def like?(user)
    Like.where(user_id: user.id).exists?
  end
end
