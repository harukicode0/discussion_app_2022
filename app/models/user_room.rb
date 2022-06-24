class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one :position,dependent: :destroy
end
