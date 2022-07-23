class Comment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :standing_position
  belongs_to :user
  belongs_to :room
  has_many :likes,dependent: :destroy

  with_options presence: true do
    validates :text
    validates :standing_position_id
  end
  # validates :standing_position_id, numericality: true

  def like?(user, comment)
    Like.where(user_id: user.id, comment_id:comment.id).exists?
  end

  def count_like(comment)
    Like.where(comment_id:comment.id).count
  end
end
