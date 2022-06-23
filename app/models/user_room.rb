class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one :postion,dependent: :destroy
end
