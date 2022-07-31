class CommentReply < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  validates :text, presence: true, length: {minimum:1, maximum:2000}
end
