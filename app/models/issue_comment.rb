class IssueComment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :standing_position
  belongs_to :issue
end