class Comment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :standing_position
  belongs_to :user
  belongs_to :room
  has_many :likes,dependent: :destroy
  has_many :comment_replies, dependent: :destroy

  with_options presence: true do
    validates :text
    validates :standing_position_id,  numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 2}
  end

  def like?(user, comment)
    Like.where(user_id: user.id, comment_id:comment.id).exists?
  end

  def count_like(comment)
    Like.where(comment_id:comment.id).count
  end

  def count_reply(comment)
    CommentReply.where(comment_id: comment.id).count
  end
end
