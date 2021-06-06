class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, length: { minimum: 6 },format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
  validates :last_name
  validates :first_name
end
with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
  validates :last_name_kana
  validates :first_name_kana
end
  validates :birthday, presence: true

  #has_many :items
  #has_many :comments
  #has_many :purchases

end
