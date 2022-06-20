class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アクティブハッシュの読み込みのための記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  validates :sex_id, numericality: true
end
