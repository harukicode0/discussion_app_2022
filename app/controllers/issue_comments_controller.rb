class IssueCommentsController < ApplicationController
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :standing_position
  belongs_to :issue
end
