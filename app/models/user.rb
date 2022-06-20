class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アクティブハッシュの読み込みのための記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  #association
  belongs_to :sex
  has_many :rooms ,through: :user_room
  #validates
  validates :sex_id, numericality: true
end
