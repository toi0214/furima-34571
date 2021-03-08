class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :given_name, presence: true 
  validates :last_name, presence: true
  validates :birthday_id, presence: true

end