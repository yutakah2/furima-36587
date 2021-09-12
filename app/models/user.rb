class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :name
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください'}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください'}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください'}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください'}
    validates :birthday
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with:  VALID_PASSWORD_REGEX, message:'半角英数を両方含む必要があります'
end
