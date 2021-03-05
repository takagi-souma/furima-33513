class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  full_width = /\A[ぁ-んァ-ン一-龥]/
  katakana = /\A[ァ-ヶー－]+\z/
  validates :nickname, presence: true
  validates :last_name,presence: true,format: {with: full_width , message: "Full-width characters"}
  validates :last_name_kana, presence: true,format: {with: katakana , message: "Full-width katakana characters"}
  validates :first_name, presence: true,format: {with: full_width , message: "Full-width characters"}
  validates :first_name_kana, presence: true,format: {with: katakana , message: "Full-width katakana characters"}
  validates :birth_date, presence: true
  validates :password, format: {with: /\A[a-zA-Z0-9]+\z/ , message: "Password Include both letters and numbers"}

  has_many :items
  has_many :orders
end
