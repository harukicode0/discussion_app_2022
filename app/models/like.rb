class Like < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  belongs_to :issue_comment
end
