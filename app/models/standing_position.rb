class StandingPosition < ActiveHash::Base
  self.data = [
    { id: 0, name: '中立' },
    { id: 1, name: '賛成' },
    { id: 2, name: '反対' }
  ]

  include ActiveHash::Associations
  has_many :positions
  has_many :comments
end