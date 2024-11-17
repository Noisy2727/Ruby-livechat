class Message < ApplicationRecord
  belongs_to :chatroom
  after_create_commit do
    broadcast_append_to "chatroom_#{chatroom.id}", target: "messages"
  end
end
