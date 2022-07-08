class IssueLike < ApplicationRecord
  belongs_to :issue_comment
  belongs_to :user
end
