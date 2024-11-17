class ChatroomsController < ApplicationController

  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @chatrooms = Chatroom.public_rooms
    #@users = User.all_except(@current_user)
  end
end
