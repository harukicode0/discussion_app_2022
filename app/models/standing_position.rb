class StandingPosition < ActiveHash::Base
  self.data = [
    { id: 0, name: '中立' },
    { id: 1, name: 'Yes' },
    { id: 2, name: 'No' }
  ]

  include ActiveHash::Associations
  has_many :positions
  has_many :comments
  has_many :issue_comments
end