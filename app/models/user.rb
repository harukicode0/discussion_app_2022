class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アクティブハッシュの読み込みのための記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  #association
  belongs_to :sex
  has_many :user_rooms
  has_many :rooms ,through: :user_rooms
  has_many :comments
  has_many :owners
  #validates
  validates :sex_id, numericality: { other_than: 0,message: "can't be blank" }
end
