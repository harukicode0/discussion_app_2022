class IssueReply < ApplicationRecord
  belongs_to :issue_comment
  belongs_to :user

  validates :text, presence: true, length: {minimum:1, maximum:2000}
end
