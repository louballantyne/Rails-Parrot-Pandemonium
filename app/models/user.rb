class User < ApplicationRecord
  has_secure_password
  has_many :messages

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  #validates :password_confirmation, presence: true

end
