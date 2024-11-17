#app/models/room.rb
class Room < ApplicationRecord
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
  after_create_commit {broadcast_append_to "rooms"}
  after_create_commit do
    broadcast_append_to "rooms"
    #broadcast_append_to "chatroom_#{self.id}", target: "messages"
  end
end
