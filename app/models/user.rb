class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アクティブハッシュの読み込みのための記述
  extend ActiveHash::Associations::ActiveRecordExtensions

  #association
  belongs_to :sex
  has_many :user_rooms,dependent: :destroy
  has_many :rooms ,through: :user_rooms
  has_many :owner_rooms, class_name: 'Room'
  has_many :comments,dependent: :destroy
  has_many :likes,dependent: :destroy

  #フォロ機能のアソシエーション
  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower

  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following

  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end
end
