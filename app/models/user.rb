class User < ApplicationRecord
  has_many :entries
  validates :email, presence: true, uniqueness: true
  has_secure_password
end

