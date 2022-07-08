class IssueComment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :standing_position
  belongs_to :issue
  belongs_to :user
  has_many :likes
end
