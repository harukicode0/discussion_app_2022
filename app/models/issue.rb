class Issue < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many :issue_comments, dependent: :destroy

  validates :issue_title, presence: true
end
