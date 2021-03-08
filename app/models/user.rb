class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :first_name_kana
    validates :last_name
    validates :last_name_kana
    validates :birth_date
  end

  validates :last_name,format: {with: /\A[ぁ-んァ-ン一-龥々]/ , message: "Full-width characters"}
  validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ , message: "Full-width katakana characters"}
  validates :first_name,format: {with: /\A[ぁ-んァ-ン一-龥々]/ , message: "Full-width characters"}
  validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ , message: "Full-width katakana characters"}
  validates :password, format: {with:  /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i , message: "Include both letters and numbers"}

end
