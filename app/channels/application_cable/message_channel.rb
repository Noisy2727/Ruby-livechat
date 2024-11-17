# app/channels/message_channel.rb
class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_for chatroom # Subscribe to the chatroom stream for messages
  end

  def receive(data)
    chatroom = Chatroom.find(data['chatroom_id'])
    message = chatroom.messages.create!(content: data['content'], user: current_user)
    
    # Broadcast the new message to the chatroom's stream
    broadcast_to(chatroom, message: message.content, user: current_user.username)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
