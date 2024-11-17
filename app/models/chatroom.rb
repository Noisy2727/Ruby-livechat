class Chatroom < ApplicationRecord
  has_many :messages
  # is_public = FALSE
  validates :title, presence: true
  validates :body, presence: true  # Broadcast the chatroom to Turbo Streams
  after_create_commit do
    broadcast_append_to "chatrooms", target: "chatrooms_list", partial: "chatrooms/chatroom", locals: { chatroom: self }
  end
end
