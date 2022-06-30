class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms
  has_many :comments,dependent: :destroy
  has_one :owner

  with_options presence: true do
    validates :name
  end

  def self.search(search)
    if search != ""
      Room.where('name LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end

  def is_followed_by?(user)
    Relationship.find_by(following_id: user.id).present?
  end
end
