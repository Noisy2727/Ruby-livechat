class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # Stream from a specific chatroom
    Rails.logger.info "Client subscribed to ChatroomChannel with params: #{params.inspect}"
    stream_for chatroom
    stream_from "chatroom_#{params[:chatroom_id]}"
  end

  def receive(data)
    # You can use this to handle any incoming data or messages if needed
    # In this case, we could also broadcast an incoming message
    chatroom = Chatroom.find(data['chatroom_id'])
    # message = chatroom.messages.create!(content: data['message'])
    # broadcast_to(chatroom, message: message.content)
  end

  def unsubscribed
    # Cleanup if needed when user unsubscribes
    Rails.logger.info "Client unsubscribed from ChatroomChannel"
  end
end
