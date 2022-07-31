class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence:true, presence: { message: "を入力してください"}

  validates :image, content_type: {in:[:png, :jpg, :jpeg], message: "はpng, jpg, jpegいずれかの形式にして下さい"},
  size: { between: 1.kilobyte..4.megabytes , message: '画像容量が大きすぎぃ、4megabytes以下でおなしゃす' }

  #アクティブハッシュの読み込みのための記述
  extend ActiveHash::Associations::ActiveRecordExtensions

  #association
  belongs_to :sex
  has_many :user_rooms,dependent: :destroy
  has_many :rooms ,through: :user_rooms
  has_many :comments,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :issue_comments, dependent: :destroy
  has_many :issue_likes, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :issues
  has_many :comment_replies, dependent: :destroy

  #フォロ機能のアソシエーション
  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower

  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following

  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end
end
