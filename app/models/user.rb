class User < ApplicationRecord
  has_secure_password
  
  after_create_commit { broadcast_append_to "users" }
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
end