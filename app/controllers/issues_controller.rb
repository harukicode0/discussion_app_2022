class IssuesController < ApplicationController
  belongs_to :room
  has_many :issue_comments, dependent: :destroy
end
