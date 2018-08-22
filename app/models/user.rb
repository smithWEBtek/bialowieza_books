class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_one :profile 
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 6..12 }

end
