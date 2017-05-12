class User < ApplicationRecord
  before_save {username.downcase!}
  validates :username   , presence: true, length: {maximum: 10}, uniqueness: true
  validates :name       , presence: true, length: {maximum: 30}

  has_secure_password
  validates :password   , presence: true, length: {minimum: 3}
end
