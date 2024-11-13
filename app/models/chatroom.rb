class Chatroom < ApplicationRecord
  has_many :messages
  # is_public = FALSE

  validates :title, presence: true
  validates :body, presence: true
end
