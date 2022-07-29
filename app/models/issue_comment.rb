class IssueComment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :standing_position
  belongs_to :issue
  belongs_to :user
  has_many :issue_likes, dependent: :destroy

  with_options presence: true do
    validates :textlength: {minimum:1, maximum:2000}
    validates :standing_position_id,  numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 2}
  end

  def issue_like?(user, comment)
    IssueLike.where(user_id: user.id, issue_comment_id:comment.id).exists?
  end

  def count_issue_like(comment)
    IssueLike.where(issue_comment_id:comment.id).count
  end
end
