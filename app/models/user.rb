class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_one :profile
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 6..12 }

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash['info']['email']).first_or_create do |user|
      user.name = auth_hash['info']['name']
      user.password = SecureRandom.hex(10)
    end
  end
end
