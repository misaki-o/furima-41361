class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 文字バリデ代入
  letter_num_mix = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i   #英数両方含む、大文字も小文字もOK,6字以上
  zenkaku = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/    #全角かな、カナ、漢字
  katakana = /\A[ァ-ヶー－]+\z/      #全角カタカナ

  validates :nickname, presence: true
  validates :password, format: { with: letter_num_mix }
  validates :family_name_kanji, presence: true, format: { with: zenkaku }
  validates :first_name_kanji, presence: true, format: { with: zenkaku }
  validates :family_name_kana, presence: true, format: { with: katakana }
  validates :first_name_kana, presence: true, format: { with: katakana }
  validates :birthday, presence: true

  #アソシエーション
  has_many :items
end
