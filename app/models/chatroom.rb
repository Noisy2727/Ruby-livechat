class Chatroom < ApplicationRecord
  has_many :messages
  # is_public = FALSE
  validates :title, presence: true
  validates :body, presence: true  # Broadcast the chatroom to Turbo Streams
  after_create_commit {broadcast_append_to "chatrooms"}
  after_create_commit do
    broadcast_append_to "chatrooms"
    #broadcast_append_to "chatroom_#{self.id}", target: "messages"
  end
end
