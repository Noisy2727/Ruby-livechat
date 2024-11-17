#app/models/chatroom.rb
class Chatroom < ApplicationRecord
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
  after_create_commit {broadcast_append_to "chatrooms"}
  after_create_commit do
    broadcast_append_to "chatrooms"
    #broadcast_append_to "chatroom_#{self.id}", target: "messages"
  end
end
