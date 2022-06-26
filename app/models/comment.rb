class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :position

  with_options presence: true do
    validates :text
    validates :position_id
  end
end
