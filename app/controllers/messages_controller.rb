class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = @chatroom.messages.create(message_params)
    redirect_to chatroom_path(@chatroom)
  end

  private
    def message_params
      params.require(:message).permit(:messenger, :body)
    end
end
