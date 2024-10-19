class Chatroom < ApplicationRecord
  has_many :messages

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
