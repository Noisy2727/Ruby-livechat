class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  # is_public = FALSE

  validates :title, presence: true
  validates :body, presence: true
  validates :owner, presence: true
end
