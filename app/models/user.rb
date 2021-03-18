class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday_id

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "全角文字を使用してください" } do
      validates :first_name
      validates :second_name
    end

    with_options format: { with: /\A[ァ-ヶ一]+\z/, message: '全角文字を使用してください' } do
      validates :given_name
      validates :last_name
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end