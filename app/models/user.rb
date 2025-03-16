class User < ApplicationRecord
  has_many :entries
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  has_secure_password
end

