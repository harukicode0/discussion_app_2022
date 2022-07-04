class Room < ApplicationRecord
  has_many :user_rooms,dependent: :destroy
  has_many :users, through: :user_rooms
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :comments,dependent: :destroy
  has_many :room_tags, dependent: :destroy
  has_many :tags, through: :room_tags

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
