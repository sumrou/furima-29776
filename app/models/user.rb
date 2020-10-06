class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :first_name_kanji, :last_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'には全角文字を使用してください' }
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'はカタカナで入力して下さい' }
  validates :nickname, :birthday, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
