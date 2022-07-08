class Issue < ApplicationRecord
  belongs_to :room
  has_many :issue_comments, dependent: :destroy
  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  validates :issue_title, presence: true
end
