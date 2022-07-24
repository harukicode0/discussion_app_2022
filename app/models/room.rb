class Room < ApplicationRecord
  has_many :user_rooms,dependent: :destroy
  has_many :users, through: :user_rooms
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :comments,dependent: :destroy
  has_many :room_tags, dependent: :destroy
  has_many :tags, through: :room_tags
  has_many :issues, dependent: :destroy

  # validate
  validates :title, presence: true
  # カスタムメソッド
  validate :deadline_date_cannot_be 

  def self.search(search)
    if search != ""
      Room.where('title LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end

  def is_followed_by?(user)
    Relationship.find_by(following_id: user.id).present?
  end

  private
  def deadline_date_cannot_be
    if (deadline.present? && deadline > Time.now + 5.days + 1.seconds) || (deadline.present? && deadline < Time.now) || deadline.nil?
      errors.add(:deadline, "開催期間は1〜5日のいずれかを選択してください")
    end
  end
end
